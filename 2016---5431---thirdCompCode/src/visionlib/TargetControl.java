package visionlib;

import edu.wpi.first.wpilibj.Timer;
import staticlibs.DriveBase;
import staticlibs.Shooter;
import staticlibs.SmarterDashboard;

public class TargetControl {
	private static double[] encodersDistance = {0, 0};
	//private double[] encodersRPM = {0};
	private static double wheelCircum = DriveBase.wheelDiameter * Math.PI;//10 is distance in inches - must change;
	private static double driveForwardDistance = 0;
	static Vision cameraVision = new Vision();
	private static boolean pass = false;
	public final static int abortAutoAim = -42;		//Get the joke, anyone?
	private static int shootStates = 0;
	private static long autoAimTimer = 0;
	private static long autoAimIntakeTimer = 0;
	private static long autoAimManualTimer = 0;
	private static long extendClimberTimer = 0;
	private static long raiseClimberTimer = 0;
	//private static int autoAimRemoteState = 0;	//Used for the shoot() function within autoAim()
	private static final int[] off = {0, 0};
	private static boolean inAuto = false;
	public static double moveAmount = 0.47;
	public static int checkAmount = 3;
	private static int timesCount = 0;
	public static boolean shotTheBall = false;
	
	
	
	public static int autoAim(int state){
		SmarterDashboard.putBoolean("AUTO", state>0);
		
		switch(state){
			default:
				break;
			case 0:
				Vision.Update();
				inAuto = false;
				timesCount = 0;
				break;
			case 1:
				Vision.Update();
				
				if(Vision.manVals[1] == 0) {
					pass = true;
				} 
				else if(Vision.manVals[1] == 1){
					DriveBase.drive(0.46, 0.46);
					state = 1;
					pass = false;
				}
				else if(Vision.manVals[1] == 2){
					DriveBase.drive(-0.46, -0.46);
					state = 1;
					pass = false;
				} else if(Vision.manVals[0] == 5) {// || Vision.manVals[1] == 5){
					SmarterDashboard.putString("ERROR", "It's too close and too far");
					DriveBase.drive(0, 0);
					state = abortAutoAim;
				}
				
				//You get it now, right?
				if(pass) {
					DriveBase.setBrakeMode(true);
					if(Vision.manVals[0] == 0) {
						if(timesCount > checkAmount) {
							state = 4;//Change when you want f/backward		
						} else {
							state = 1;
							timesCount += 1;
							Timer.delay(0.1);
						}
					}
					else if(Vision.manVals[0] == 1){
						DriveBase.drive(-moveAmount,  moveAmount);
						state = 1;
					}
					else if(Vision.manVals[0] == 2){
						DriveBase.drive(moveAmount,  -moveAmount);
						state = 1;
					}
					else if(Vision.manVals[0] == 5) {// || Vision.manVals[1] == 5){
						SmarterDashboard.putString("ERROR", "It's too close and too far");
						DriveBase.drive(0, 0);
						state = abortAutoAim;
						
					}
					else {
						state = abortAutoAim; //manVals[0] should only be 0-2. Nothing else. Somethign is wrong.
					}
				}
				break;
			/*
			case 3:
				cameraVision.Update();
				//SmartDashboard.putNumber("STATE STATE STATE", state);
				if(Vision.manVals[1] == 0){
					if(Vision.manVals[0] != 0)//Make sure turn left + right is alright
						state = 2;
					else{
						state = 4;
						//autoAimRemoteState = 1;
						//SmartDashboard.putNumber("remoteBugIn", autoAimRemoteState);
					}
				}
				else if(Vision.manVals[1] == 1){
					DriveBase.drive(-0.55, -0.55);
					state = 3;
				}
				else if(Vision.manVals[1] == 2){
					DriveBase.drive(.55, .55);
					state = 3;
				}
				else
					state = abortAutoAim;
				break;*/
			case 4:
				Robot.drivebase.disableBrakeMode();
				//SmartDashboard.putNumber("STATE STATE STATE", state);
				////SmartDashboard.putNumber("remoteBug", autoAimRemoteState);
				//autoAimRemoteState = 
				//if(autoAimRemoteState == 4)
					//state = 0;
				shootStates = 1;
				inAuto = true;
				state = 5;
				break;
			case 5:	
				state = 5;
				//shootStates = shoot(shootStates, 0.8);
				//if(shootStates == 0) {state = -1;}
				double speeds3[] = {1, 1}; 
				for(int a = 0; a < 1000; a++) {
					Shooter.setFlywheelSpeed(speeds3);
					Timer.delay(0.005);
					if(a > 600) {
						Shooter.setIntakeSpeed(1);
					}
				}
				shotTheBall = true;
				Shooter.setFlywheelSpeed(off);
				state = 1;
				break;
			case abortAutoAim:
				//SmartDashboard.putString("Bug", "Failed to AutoAim");
				state = 1;
				break;
			case -1:
				Robot.drivebase.disableBrakeMode();
				//SmartDashboard.putNumber("STATE STATE STATE", -1);
				Shooter.setFlywheelSpeed(off);
				Shooter.setIntakeSpeed(0);
				state = 0;
				break;
			}
		return state;
	}
	
	public static int shoot(int state, double shootSpeed){//shootSpeed is temp since there is no camera at the time of coding
		double toSetSpeed = shootSpeed+SmarterDashboard.getNumber("OVERDRIVE", 0.0);
		cameraVision.Update();
		//SmartDashboard.putNumber("SysTime", System.currentTimeMillis());
		/*if(Vision.manVals[1] == 1) {
			SmarterDashboard.addDebugString("You're too close");
		} else if(Vision.manVals[1] == 2) {
			SmarterDashboard.addDebugString("You're too far");
		} else {
			SmarterDashboard.addDebugString("You're good");
		}*/
		switch(state){
		default:
				break;
			case 0:
				break;
			case 1:
				SmarterDashboard.putBoolean("AUTO", true);
				double[] speeds = {toSetSpeed, toSetSpeed};
				Shooter.setFlywheelSpeed(speeds);
				autoAimTimer = System.currentTimeMillis() + 2500;
	    		Shooter.leftFW.setVoltageRampRate(1);
	    		Shooter.rightFW.setVoltageRampRate(1);
				
				state = 2;
			case 2:
				//SmartDashboard.putNumber("shootBug", System.currentTimeMillis());
				//SmartDashboard.putNumber("shootBug2", autoAimTimer);
				
				double[] curRPM = Shooter.getRPM();
				double[] speedsTwo = cameraVision.getRPMS(curRPM, toSetSpeed);
				//SmartDashboard.putString("LEFTRIGHT", String.valueOf(speedsTwo[2]) + ":" + String.valueOf(speedsTwo[3]));
				//SmartDashboard.putString("NEEDEDLEFTRIGHT", String.valueOf(speedsTwo[4]) + ":" + String.valueOf(speedsTwo[5]));
				double leftPower = Shooter.getLeftPower(); //SmarterDashboard.getNumber("OVERDRIVE", 0.0);;
				double rightPower = Shooter.getRightPower(); //+ SmarterDashboard.getNumber("OVERDRIVE", 0.0);;
				double newPower[] = {leftPower +(speedsTwo[0] / 3.5), rightPower + (speedsTwo[1] /3.5)};
				Shooter.setFlywheelSpeed(newPower);
				if(cameraVision.withIn(speedsTwo[2], -400, 400) && cameraVision.withIn(speedsTwo[3], -400, 400)) {
					
					/*if(passedTimes < 4) {
						Timer.delay(0.1);
						passedTimes += 1;
					} else {*/
				//if(System.currentTimeMillis() >= autoAimTimer){]
						final double newSpeed[] = {newPower[0] - 0.1, // + 0.009 + (SmarterDashboard.getNumber("OVERDRIVE", 0.0) /10), 
								newPower[1] - 0.1};// + 0.009 + (SmarterDashboard.getNumber("OVERDRIVE", 0.0) /10)};
						Shooter.setFlywheelSpeed(newSpeed);
						//Timer.delay(0.2);
						////SmartDashboard.putNumber("autoAimIntakebug", System.currentTimeMillis());
						Shooter.setIntakeSpeed(1);
						if(inAuto) {
							for(int a = 0;a < 200; a++) {
								Shooter.setIntakeSpeed(1);
								Timer.delay(0.005);
							}
							shotTheBall = true;
							Shooter.setPIDSpeed(off);
						}
						autoAimIntakeTimer = System.currentTimeMillis() + 1750;
						//SmartDashboard.putNumber("autoAimIntakeBug2", autoAimIntakeTimer);
						state = 3;
					//}
				}
				else
					state = 2;
				break;
			case 3:
				if(System.currentTimeMillis() >= autoAimIntakeTimer){
					SmarterDashboard.putBoolean("AUTO", false);
					Shooter.setIntakeSpeed(0);
					Shooter.setPIDSpeed(off);
					state = 4;
				}
				else
					state = 3;
				break;
			case 4:			//This is to allow remoteStates to know when program is done
				state = 0;
				break;
			case -1://You are aborting
				Shooter.setIntakeSpeed(0);
				Shooter.setPIDSpeed(off);
				state = 0;
		}
		return state;
	}	
	
	
}
