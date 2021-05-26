package common;

public class Utility {

	// 文字列チェック（NULLの場合は空文字で返却）
	public static String getStringData(Object target) {
		return target == null ? "" : (String)target;
	}

}
