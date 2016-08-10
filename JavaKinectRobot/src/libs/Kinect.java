package libs;

import edu.ufl.digitalworlds.j4k.DepthMap;
import edu.ufl.digitalworlds.j4k.J4KSDK;
import edu.ufl.digitalworlds.j4k.VideoFrame;

public class Kinect extends J4KSDK{

	public VideoFrame videoTexture;
	
	public Kinect() {
		super();
		videoTexture = new VideoFrame();
	}
	
	@Override
	public void onColorFrameEvent(byte[] data) {
		videoTexture.update(getColorWidth(), getColorHeight(), data);
	}

	@Override
	public void onDepthFrameEvent(short[] depthFrame, byte[] playerIndex, float[] XYZ, float[] UV) {
		DepthMap map = new DepthMap(getDepthWidth(), getDepthHeight(), XYZ);
		if(UV != null) map.setUV(UV);
	}

	@Override
	public void onSkeletonFrameEvent(boolean[] arg0, float[] arg1, float[] arg2, byte[] arg3) {}
	
	/*
	@Override
	public void onInfraredFrameEvent(short[] data) {

	}*/

}
