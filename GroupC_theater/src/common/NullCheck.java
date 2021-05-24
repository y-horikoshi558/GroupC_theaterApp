package common;

public class NullCheck {

	public static String nullCheckBoolean(String str)
	{
		return str == "" || str == null ? "" : str;
	}

}
