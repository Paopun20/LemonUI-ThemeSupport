package lemonui;

import lemonui.themes.ThemeManager;

class Constants
{
	public static var FONT_REGULAR(get, never):String;
	public static var FONT_BOLD(get, never):String;

	static function get_FONT_REGULAR():String
		return ThemeManager.fontRegular;

	static function get_FONT_BOLD():String
		return ThemeManager.fontBold;
}
