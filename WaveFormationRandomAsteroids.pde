public class WaveFormationRandomAsteroids extends Wave{

	WaveFormationRandomAsteroids(int wave) {
		super(wave);

		units = new Enemy[(int)sqrt(wave)*2+1];

		for(int i =0; i < units.length; i++){
			units[i] = new Enemy(new PVector(random(0, width), random(-height, 0)), 
				velocity, //changing this wave velocity will change the velocity of all child "Enemy"s 
				this,3);
		}
	}

	void draw() {
		//debug draw
		super.draw();
		text("Wave.WaveFormationRandomAsteroids", position.x, position.y);
		text(units.length, position.x, position.y+8);
	}

}