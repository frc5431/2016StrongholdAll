package main;

import edu.ufl.digitalworlds.j4k.J4KSDK;
import libs.Kinect;

public class Main {
	
	private static Kinect kinect;
	
	public static void main(String[] args) {
		kinect = new Kinect();
		System.out.println("Starting the Kinect");
		kinect.start(J4KSDK.COLOR|J4KSDK.DEPTH|J4KSDK.INFRARED);
		sleep(100);
		while(!kinect.isInitialized()){}
		System.out.println("Started!");
	}
	
	private static void sleep(long millis) {
		try {Thread.sleep(millis);} catch (InterruptedException e) {e.printStackTrace();}
	}
	
}
