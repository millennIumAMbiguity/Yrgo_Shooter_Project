public class Health 
{
	int hitPoints;
	int maxHP;

	long immunityEndTime;
	long immunityTime;
	long timeStamp;

	Health(int hp, long immunityTime){
		this.immunityTime = immunityTime;
		hitPoints = maxHP = hp;
	}

	boolean add(int hp){
		if (hitPoints < maxHP){
			hitPoints+=hp;
			return false;
		}
		return true;
	}

	boolean sub(int hp){
		/*
		if (immunityEndTime > time){
			return false;
		}
		*/
		hitPoints-=hp;
		immunityEndTime = time + immunityTime;
		timeStamp = time;
		if (hitPoints < 1) {
			return true;
		}
		return false;
	}

	boolean imunity(){
		return immunityEndTime > time && timeStamp != time;
	}
}