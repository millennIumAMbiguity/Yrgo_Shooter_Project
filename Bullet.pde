class Bullet extends Gameobject{

	public Bullet(int collisionLayer, PVector velocity, PVector position, color bulletColor){
		this.collisionLayer = collisionLayer;
		this.position = position;
		this.velocity = velocity;
		objColor = bulletColor;
		collisionSize = 2;
		hp = new Health(1, 0);
		if (collisionLayer == 2)
			objColor = 0xFFD4886A;
		else
			objColor = 0xFF75AF96;
	}

	void draw() {
		fill(objColor);
		noStroke();
		ellipse(position.x, position.y, 3, 6);
	}

	void outOfBounds(){
		if (collisionLayer != 0)
			if (position.x < -collisionSize || position.x > width +collisionSize ||
				position.y < -collisionSize || position.y > height+collisionSize)
			{
				if (collisionLayer == 1)
				stats.shootsMis++;
				removeFromScene();
			}
	}
	
}