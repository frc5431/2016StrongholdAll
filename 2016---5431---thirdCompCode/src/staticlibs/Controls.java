package staticlibs;

import edu.wpi.first.wpilibj.Joystick;

public class Controls {
	private static Joystick xbox, joystick;
	
	public double 
			xboxRightJoystickVal = 0,
			xboxLeftJoystickVal = 0,
			joystickPotentiometerVal = 0.0,
			joystickYVal = 0.0;
	
	public boolean
			//Xbox joystick
			xboxAVal = false,
			xboxBVal = false,
			xboxXVal = false,
			xboxYVal = false,
			xboxBLeft = false,
			xboxBRight = false,
			//Gun joystick
			joystickTriggerVal = false,
			joystickButton2 = false,
			joystickButton3 = false,
			joystickButton4 = false,
			joystickButton5 = false,
			joystickButton6 = false,
			joystickButton7 = false,
			joystickButton8 = false,
			joystickButton10 = false,
			joystickButton11 = false;
	
	private final static int 
	
			//Drive joystick
			xboxNum = 0,
			xboxLeftTrigger = 2,
			xboxRightTrigger = 3,
			xboxRightJoy = 1,
			xboxLeftJoy = 5,
			xboxButtonA = 1,
			xboxButtonB = 2,
			xboxButtonX = 3,
			xboxButtonY = 4,
			xboxBumperLeft = 5,
			xboxBumperRight = 6,
			
			//Gun joystick
			joystickNum = 1,
			joystickYAxis = 1,
			joystickPotentiometer = 2,
			joystickTrigger = 1,
			joystickButtonLabeled2 = 2,
			joystickButtonLabeled3 = 3,
			joystickButtonLabeled4 = 4,
			joystickButtonLabeled5 = 5,
			joystickButtonLabeled6 = 6,
			joystickButtonLabeled7 = 7,
			joystickButtonLabeled8 = 8,
			joystickButtonLabeled10 = 10,
			joystickButtonLabeled11 = 11;
	
	public static void initControls() {
		xbox = new Joystick(xboxNum);
		joystick = new Joystick(joystickNum);
	}

	public static boolean isIntakeOn() {
		return (xbox.getRawAxis(xboxRightTrigger)) > 0.3;
	}
	
	public static boolean isRevIntakeOn() {
		return (xbox.getRawAxis(xboxLeftTrigger)) > 0.3;
	}
	//@TODO see if joystick is inverted
	public static double leftDriveVal() {
		return -(xbox.getRawAxis(xboxLeftJoy)); //Since it's inversed 
	}
	
	public static double rightDriveVal() {
		return -(xbox.getRawAxis(xboxRightJoy));
	}
	
	public static boolean isManualShoot() {
		return joystick.getRawButton(joystickButtonLabeled2);
	}
	
	public static double gunYVal() {
		return -(joystick.getRawAxis(joystickYAxis));
	}
	
	public static boolean gunShoot() {
		return joystick.getRawButton(joystickTrigger);
	}
	
	public static boolean gunAutoAim() {
		return joystick.getRawButton(joystickButtonLabeled4);
	}
	
	public static boolean gunKillSwitch() {
		return joystick.getRawButton(joystickButtonLabeled5);
	}
	
	public static boolean isChopperDown() {
		return xbox.getRawButton(xboxBumperLeft);
	}
	
	public static boolean isChopperUp() {
		return xbox.getRawButton(xboxBumperRight);
	}
	
	public static boolean isGunShoot() {
		return xbox.getRawButton(joystickButtonLabeled3) || xbox.getRawButton(joystickButtonLabeled8);
	}
	
}
