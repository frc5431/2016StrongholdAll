package gun;

public class Shooter {

	public Shooter()
	{
		
	}
	
	public boolean boundries(double TowerX, double TowerY, double FieldX, double FieldY, double fromX, double fromY)
	{
		double line = (TowerY-FieldY)/(TowerX-FieldX) * (fromX - FieldX) + FieldY;
		return (fromY >= line) ? false : true;
	}
	
}
