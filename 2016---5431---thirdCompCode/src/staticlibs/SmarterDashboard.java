package staticlibs;

import edu.wpi.first.wpilibj.networktables.NetworkTable;

public class SmarterDashboard {
	private static NetworkTable table;

	public static void initSmarterDash() {
		table = NetworkTable.getTable("5431");
	}

	public static void put(String key, Object o) {
		table.putValue(key, o);
	}

	public static Object get(String key) {
		return table.getValue(key, null);
	}

	public static void putString(String key, String val) {
		table.putString(key, val);
	}

	public static void putBoolean(String key, boolean val) {
		table.putBoolean(key, val);
	}

	public static void putNumber(String key, double val) {
		table.putNumber(key, val);
	}

	public static String getString(String key, String def) {
		return table.getString(key, def);
	}

	public static boolean getBoolean(String key, boolean def) {
		return table.getBoolean(key, def);
	}

	public static double getNumber(String key, double def) {
		return table.getNumber(key, def);
	}

}
