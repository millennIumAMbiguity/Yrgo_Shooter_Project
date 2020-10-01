class Enemy extends Gameobject{

	Wave parent;

	boolean exist = true;

	PVector[] shapeCords;

	Enemy(PVector pos, PVector vel, Wave parent, int hp, PVector[] shapeCords){
		this.shapeCords = shapeCords;
		position = pos;
		velocity = vel;
		this.parent = parent;
		this.hp = new Health(hp, 200);
		collisionLayer = 2;
		objColor = 0xFFD4886A;
		objStrokeColor = 0xFFAA5939;

		bulletSpeed = new PVector(0,1);
		fireDelay = 2000;
		nextfire = time + (id&31)*100;

		stats.enemiesSeen++;
	}


	void outOfBounds(){
		if (collisionLayer != 0){
			if (position.y > height+collisionSize)
			{
				parent.cleenWave = false;
				removeFromScene();
			}
		}
	}

	void removeFromScene() {
		exist = false;
		scene.remove(id);
		waveController.removeEnemy(parent.wave);
		int sceneSize = scene.size();
		for (int i = id; i < sceneSize; ++i) {
			scene.get(i).id--;
		}
	}

	void fire() {
		if(position.y < 0)
			return;
		if (nextfire < time){
			nextfire = time + fireDelay;
			new Bullet(3,bulletSpeed,position.copy(),color(255,0,0));
		}
	}

	void draw() {
		stroke(objStrokeColor);
		if (hp.imunity())
			fill(objColor&0x4FFFFFFF);
		else
			fill(objColor);

		//ellipse(position.x, position.y, collisionSize, collisionSize);

		beginShape();
		for (PVector vert : shapeCords) {
			vertex(position.x + vert.x, position.y + vert.y);
		}
		endShape(CLOSE);
	}


}
