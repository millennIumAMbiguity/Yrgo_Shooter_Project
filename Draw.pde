int offsetFromSide = 20;
int spacing = 20;

void draw(){

	time = millis();
	background(0);

	if (titleScreen) {
		intro();

	} else {

		for (Gameobject obj : ghostScene) {
			obj.move();
		}

		for (Gameobject obj : ghostScene) {
			obj.outOfBounds();
		}

		for (Gameobject obj : ghostScene) {
			obj.collision();
		}

		for (Gameobject obj : ghostScene) {
			obj.action();
		}

		for (Star star : starsInScene) {
			star.move();
		}

		for (Gameobject obj : ghostScene) {
			obj.draw();
		}


		if (!gameover){

			waveController.update();

			fill(0xFF718EA4);
			gameUI();
			
		} else {
			fill(0xFFFFFFFF);
			textAlign(CENTER);
			textSize(32);
			text("Game Over", width/2, height/2 - (spacing * 3));
			textSize(15);
			text("Final score: " + score, width/2, height/2 - (spacing));

			fill(0xFF718EA4);
			textAlign(RIGHT);
			text("Distance: ", width/2, height/2 + (spacing*2));
			text("Kills: ", width/2, height/2 + (spacing*3));
			text("kills/max kills: ", width/2, height/2 + (spacing*4));
			text("Shoots Fired: ", width/2, height/2 + (spacing*5));
			text("Hit Ratio: ", width/2, height/2 + (spacing*6));

			textAlign(LEFT);
			text(distConverter.convertDistance(), width/2, height/2 + (spacing*2));
			text(stats.kills, width/2, height/2 + (spacing*3));
			text(nf((float)stats.kills / stats.enemiesSeen * 100,0,2) + "%", width/2, height/2 + (spacing*4));
			text(stats.shootsFired, width/2, height/2 + (spacing*5));
			text(nf((float)(stats.shootsFired-stats.shootsMis) / stats.shootsFired * 100,0,2) + "%", width/2, height/2 + (spacing*6));

		}

		//add new scene objects to scene
		ghostScene = new ArrayList<Gameobject>(scene);
	}
}


void gameUI(){
	dist = height + (int)(time/30) - (int)ghostScene.get(0).position.y;
	distScore = dist/500;
	textAlign(LEFT);
	textSize(12);
	
	text("Distance: "+distConverter.convertDistance(), offsetFromSide,spacing);
	text("Lives: " + player.hp.hitPoints, offsetFromSide, spacing*2);
	text("Wave: " + waveController.waveCount, offsetFromSide, spacing*3);

	textAlign(CENTER);
	textSize(20);
	if (scoreScoll < score){
		scoreScoll += max(score-scoreScoll,0)/32f+0.0075f;
		if (scoreScoll > score)
			scoreScoll = score;
		text((int)scoreScoll+distScore, width/2, spacing*2);
	} else {
		text(score+distScore, width/2, spacing*2);
	}

	if(int(max(waveController.spawnNextWave -time,0)) > 0){
		textAlign(CENTER);
		textSize(14);
		if (waveController.willSpawn)
		text("Next wave in " + (int)max(waveController.spawnNextWave - time,0)/1000+ "s" , width/2, spacing*5);
	}
}