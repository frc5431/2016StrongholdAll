package gun;

public class Test {

	public static void main(String[] args) {
		Boulder_Shooter gun = new Boulder_Shooter(319, 191, 147.5, 20.35, 97);
		Shooter shoot = new Shooter();
		//fieldx, fieldy, towerx, towery, towerz
		System.out.println("distance: " + String.valueOf(gun.getTowerDistance(200, 120)));
		System.out.println("horz: " + String.valueOf(gun.getHorzAngle(200, 120)));
		System.out.println("vert: " + String.valueOf(gun.getVertAngle(200, 120, 14)));
		System.out.println("BOUND: " + String.valueOf(shoot.boundries(0, 0, 3, 3, 1, 0)));
	}

}
