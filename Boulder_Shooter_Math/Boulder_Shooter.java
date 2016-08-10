package gun;

public class Boulder_Shooter {
	
	double towerX, towerY, towerZ, fieldX, fieldY;
	double fromX, fromY, fromZ;
	double distance, horzAngle, vertAngle;

	public Boulder_Shooter(double fieldsX, double fieldsY, double towersX, double towersY, double towersZ) {
		this.towerX = towersX;
		this.towerY = towersY;
		this.towerZ = towersZ;
		this.fieldX = fieldsX;
		this.fieldY = fieldsY;
	}
	
	public double getVertAngle(double fromsX, double fromsY, double fromsZ)
	{
		this.vertAngle = Math.toDegrees((double) (Math.atan(this.getFieldZ(fromsZ)/this.getTowerDistance(fromsX, fromsY))));
		return this.vertAngle;
	}
	
	public double getHorzAngle(double fromsX, double fromsY)
	{
		this.horzAngle = Math.toDegrees((double) (Math.atan(this.getFieldY(fromsY)/this.getFieldX(fromsX))));
		this.horzAngle = (this.horzAngle < 0 ) ? -(90 + this.horzAngle) : (90 - this.horzAngle);
		return this.horzAngle;
	}
	
	public double getTowerDistance(double fromsX, double fromsY)
	{
		this.distance =  (double) Math.sqrt((Math.pow(this.getFieldX(fromsX), 2) + Math.pow(this.getFieldY(fromsY), 2)));
		return this.distance;
	}
	
	public double getFieldX(double fromsX)
	{
		this.fromX = (this.fieldX-this.towerX)-fromsX; 
		return this.fromX;
	}
	
	public double getFieldY(double fromsY)
	{
		this.fromY = (this.fieldY-this.towerY)-fromsY; 
		return this.fromY;
	}
	
	public double getFieldZ(double fromsZ)
	{
		this.fromZ = (this.towerZ)-fromsZ; 
		return this.fromZ;
	}

}
