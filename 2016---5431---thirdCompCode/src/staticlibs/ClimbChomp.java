package staticlibs;

import edu.wpi.first.wpilibj.CANTalon;
import maps.MotorMap;

public class ClimbChomp {

	private static CANTalon chopper;
	
	public static void initClimbChomp() {
		chopper = new CANTalon(MotorMap.chopper);
	}
	
	public static void choppersUp() {
		chopper.set(1);
	}
	
	public static void choppersDown() {
		chopper.set(1);
	}
	
}
