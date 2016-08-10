package dynlibs;

import staticlibs.ClimbChomp;
import staticlibs.Controls;
import staticlibs.DriveBase;
import staticlibs.Shooter;
import staticlibs.SmarterDashboard;

public class Teleop {
	private static int prevFlywheel = 0;
	private static int prevIntakeIn = 0;
	private static int prevIntakeOut = 0;
	private static final int[] off = {0, 0}; //Off for flywheels
	private static boolean ballIn = false;
	private static int flywheelspeed[] = {0, 0};
	private static boolean manualEnable = false;
	
	public static int currentShootState = 0;
	private static int currentAutoAimState = 0;
	
	private double controlDrive(double rawInput) {
		return (0.5 * Math.pow(rawInput, 3)) + (0.5 * rawInput);
	}
	
	public void updatePeriod() {
		DriveBase.drive(controlDrive(Controls.leftDriveVal()), controlDrive(Controls.rightDriveVal())); //Main drive, xbox controller
		
		
		//MANUAL FLY WHEEL CONTROL
		if((Controls.isManualShoot() ? 1:0) > prevFlywheel){
			if(flywheelspeed[0] > 0 && flywheelspeed[1] > 0) {
				flywheelspeed[0] = 0;
				flywheelspeed[1] = 0;
				Shooter.setPIDSpeed(flywheelspeed);
				manualEnable = false;
			} else {
				manualEnable = true;
			}
		}
		
		prevFlywheel = (Controls.isManualShoot() ? 1:0);
		
		if((Controls.isRevIntakeOn() ? 1:0) > prevIntakeOut && currentShootState == 0 && currentAutoAimState == 0) {
			Shooter.setIntakeSpeed((Shooter.getIntakeSpeed() < 0.0) ? 0 : -1);
		}
		
		
		prevIntakeOut = (Controls.isRevIntakeOn() ? 1:0);
		ballIn = Shooter.isBallIn();
		
		if(Shooter.getIntakeSpeed() > 0.0){
			if(ballIn && currentShootState == 0){
				Shooter.setIntakeSpeed(0);
			}
		}
		SmarterDashboard.putBoolean("boulder", ballIn);
		
		if((Controls.isIntakeOn() ? 1:0) > prevIntakeIn && currentShootState == 0 && currentAutoAimState == 0) {
			Shooter.setIntakeSpeed((Shooter.getIntakeSpeed() != 0) ? 0 : 1);
		}
		
		prevIntakeIn = (Controls.isIntakeOn() ? 1:0);
		
		if(Controls.gunShoot() && currentAutoAimState == 0) currentShootState = 1;
		if(Controls.gunAutoAim() && currentShootState == 0) currentAutoAimState = 1;
		if(Controls.gunKillSwitch()) {
			currentAutoAimState = -1;
			currentShootState = -1;
			manualEnable = false;
			Shooter.setPIDSpeed(off);
		}
		
		if(manualEnable) {
			int getOver = (int) (1500 * ((Controls.gunYVal() + 1)/2) + 2950);
			flywheelspeed[0] = getOver;
			flywheelspeed[1] = getOver;
			Shooter.setPIDSpeed(flywheelspeed);
		}
		
		SmarterDashboard.putNumber("POWER", flywheelspeed[0]);
		
		/* TO CLIMB DUDE
		if(input.joystickButton6 && currentAutoAimState == 0 && currentShootState == 0 && currentShootManualState == 0 && currentClimbState < 8){
			currentClimbState = 1;
		}
		else if(input.joystickButton7 && currentAutoAimState == 0 && currentShootState == 0 && currentShootManualState == 0 && currentClimbState < 8){
			currentClimbState = 8;
		}*/
		
		//if(input.joystickButton6){
		
		if(Controls.isChopperDown()) {
			ClimbChomp.choppersDown();
			SmarterDashboard.putBoolean("CHOPPERS",false);
		} else if(Controls.isChopperUp()){
			ClimbChomp.choppersUp();
			SmarterDashboard.putBoolean("CHOPPERS",true);
		}
		/*
		currentAutoAimState = SwitchCase.autoAim(currentAutoAimState);
		currentShootState = SwitchCase.shoot(currentShootState, (input.joystickPotentiometerVal + 1.0)/2.0);*/
		//currentShootState = SwitchCase.shoot(currentShootState, 0.0);
		//currentShootManualState = SwitchCase.shootManual(currentShootManualState);
		//currentClimbState = SwitchCase.climb(currentClimbState);
		
		if(Controls.isGunShoot()) {
			Shooter.setIntakeSpeed(1);
		}
		
	}
	
}
