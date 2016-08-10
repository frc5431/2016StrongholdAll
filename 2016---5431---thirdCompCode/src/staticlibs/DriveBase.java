package staticlibs;

import edu.wpi.first.wpilibj.CANTalon;
import edu.wpi.first.wpilibj.Encoder;
import edu.wpi.first.wpilibj.RobotDrive;
import edu.wpi.first.wpilibj.CounterBase.EncodingType;

//Our libs
import maps.MotorMap;
import maps.SensorMap;

public class DriveBase {
	public static final int wheelDiameter = 10;									//In inches. Used to calculate distancePerPulse
	private static final double distancePerPulse = wheelDiameter * Math.PI / 360;//Calculates distancePerPulse in inches
	private static final int samplesToAverage = 7; 								//How many pulses to do before averaging them (smoothes encoder count)
	private static final double minEncRate = 0.0; 								//Minimum Encoder Rate before hardware thinks encoders are stopped
	private static CANTalon frontright, frontleft, rearright, rearleft;					//Declaration of CANTalons used in the drivebase
	private static Encoder rightBaseEncoder;								//Declaration of encoders used in the drivebase
	private static Encoder leftBaseEncoder;
	private static RobotDrive tankDriveBase;
	
	public static void initDriveBase() {
		
		frontright = new CANTalon(MotorMap.frontright);				//Instantiates CANTalons based on mapping in RobotMap
		frontleft = new CANTalon(MotorMap.frontleft);
		rearright = new CANTalon(MotorMap.rearright);
		rearleft = new CANTalon(MotorMap.rearleft);									//If in BrakeMode, set CANTalons to brakeMode, otherwise, don't
		
		tankDriveBase = new RobotDrive(frontleft, rearleft, frontright, rearright);//Initializes RobotDrive to use tankDrive()
		
		rightBaseEncoder = new Encoder(SensorMap.rightBaseEnc1, SensorMap.rightBaseEnc2, false, EncodingType.k4X);//Using 4X encoding for encoders
		leftBaseEncoder = new Encoder(SensorMap.leftBaseEnc1, SensorMap.leftBaseEnc2, false, EncodingType.k4X);
		
		rightBaseEncoder.setDistancePerPulse(distancePerPulse);				//Sets distance robot would travel every encoder pulse
		leftBaseEncoder.setDistancePerPulse(distancePerPulse);
		
		rightBaseEncoder.setSamplesToAverage(samplesToAverage);				//Averages encoder count rate every samplesToAverage pulses
		leftBaseEncoder.setSamplesToAverage(samplesToAverage);
		
		rightBaseEncoder.setReverseDirection(false);						//Reverses encoder direction based on position on robot
		leftBaseEncoder.setReverseDirection(true);
		
		rightBaseEncoder.setMinRate(minEncRate);							//Sets minimum rate for encoder before hardware thinks it is stopped
		leftBaseEncoder.setMinRate(minEncRate);
		
	}
	
	public static void drive(double left, double right){
		tankDriveBase.tankDrive(left, right);
		//SmarterDashboard.putNumber("LEFT-DRIVE", left);
		//SmarterDashboard.putNumber("RIGHT-DRIVE", right);
	}
	
	public static void arcDrive(double move, double rotational){
		tankDriveBase.arcadeDrive(move, rotational);
		//SmarterDashboard.putNumber("LEFT-DRIVE", left);
		//SmarterDashboard.putNumber("RIGHT-DRIVE", right);
	}
	
	public static double[] getEncDistance(){
		final double returnVals[] = {
				-leftBaseEncoder.getDistance(), 
				rightBaseEncoder.getDistance()};
		//SmartDashboard.putNumber("LEFTENCODING", returnVals[0]);
		//SmartDashboard.putNumber("RIGHTENCODING", returnVals[1]);
		return returnVals;
	}
	
	public static void resetDrive() {
		leftBaseEncoder.reset();
		rightBaseEncoder.reset();
	}
	
	public static void setBrakeMode(boolean mode) {
		frontright.enableBrakeMode(mode);
		rearright.enableBrakeMode(mode);
		frontleft.enableBrakeMode(mode);
		rearleft.enableBrakeMode(mode);
	}
}
