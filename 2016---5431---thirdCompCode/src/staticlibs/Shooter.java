package staticlibs;

import edu.wpi.first.wpilibj.CANTalon;
import edu.wpi.first.wpilibj.CANTalon.FeedbackDevice;
import edu.wpi.first.wpilibj.CANTalon.TalonControlMode;
import edu.wpi.first.wpilibj.DigitalInput;
import maps.MotorMap;
import maps.SensorMap;

public class Shooter {
	static DigitalInput intakeLimit;
	static CANTalon rightFW;
	static CANTalon leftFW;
	static CANTalon intakeMotor;
	CANTalon winchMotor;
	static int rpmdelay=0;
	static double rpmbooster=0;
	public static final double[] power = { 0, 0};
	
	public Shooter(){
		intakeLimit = new DigitalInput(SensorMap.intakeLim);
		rightFW = new CANTalon(MotorMap.rightFlyWheel);
		leftFW = new CANTalon(MotorMap.leftFlyWheel);
		intakeMotor = new CANTalon(MotorMap.intake);
		
		intakeMotor.setInverted(false);
		

		leftFW.enableBrakeMode(false);
		rightFW.enableBrakeMode(false);
		leftFW.changeControlMode(TalonControlMode.Speed);
		rightFW.changeControlMode(TalonControlMode.Speed);
		leftFW.setPID(0.3, 0.001, 0.2, 0.01, 0, 12, 0);
		rightFW.setPID(0.3, 0.001, 0.2, 0.01, 0, 12, 0);
		rightFW.setFeedbackDevice(FeedbackDevice.EncRising);
		leftFW.setFeedbackDevice(FeedbackDevice.EncRising);
		leftFW.configEncoderCodesPerRev(1024);
		rightFW.configEncoderCodesPerRev(1024);
	}
	
	/**
	 * Gets the RPM of the flywheels.
	 * @return double array where index 0 is the RPM of the right, and 1 is the RPM of the left.
	 */
	public static double[] getRPM(){
		final double returnVals[] = {
				((600*leftFW.getEncVelocity())/1024),
				((600*rightFW.getEncVelocity())/1024)};
		//the 600 is multiplied for 2 reasons:
		//1 - getEncVelocity() returns it as RPS (rotations per second), so you multiply it by 60
		//2 - getEncVelocity() returns it as  1/10th as the actual RPS, so you multiply it by 10
		// thus, 60*10 = 600
		return returnVals;
	}
	
	public static boolean isBallIn() {
		return !(intakeLimit.get()); //False means there is a ball in
	}
	
	public static double getLeftPower() {
		return power[0];
	}
	
	public static double getRightPower() {
		return power[1];
	}
	
	public static void setIntakeSpeed(double speed){
		intakeMotor.set(speed);
		SmarterDashboard.putBoolean("intake", speed!=0);
		SmarterDashboard.putBoolean("INTAKE-REVERSE", speed<0);
	}
	public static double getIntakeSpeed(){
		return intakeMotor.get();
	}
	
	public static void setPIDSpeed(int[] speeds){
		leftFW.set(speeds[0]);
		rightFW.set(speeds[1]);
	}
	
}