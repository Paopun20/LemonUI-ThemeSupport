package lemonui.themes;

import flixel.util.FlxColor;

@:structInit class BaseTheme
{
	public var backgroundColor:FlxColor = 0xFF3d3f41;
	public var textColor:FlxColor = 0xFFFFFFFF;
	public var hoverColor:FlxColor = 0xFF5a5d61;
	public var activeColor:FlxColor = 0xFF2d2f31;
	public var borderColor:FlxColor = 0xFF000000;
	public var disabledColor:FlxColor = 0xFF7a7d81;
	public var accentColor:FlxColor = 0xFF3498db;
	public var fontRegular:String = "";
	public var fontBold:String = "";
	public var fontSize:Int = 13;
	public var titleSize:Int = 16;
	public var smallSize:Int = 11;
}

class Theme
{
	public static final defaultTheme:Theme = new Theme();

	public var styles:BaseTheme = {}

	public function new() {}
}

class DarkTheme extends Theme
{
	public static final instance = new DarkTheme();

	public function new()
	{
		super();
		styles = {
			backgroundColor: 0xFF3d3f41,
			textColor: 0xFFFFFFFF,
			hoverColor: 0xFF5a5d61,
			activeColor: 0xFF2d2f31,
			borderColor: 0xFF000000,
			disabledColor: 0xFF7a7d81,
			accentColor: 0xFF3498db
		}
	}
}

class LightTheme extends Theme
{
	public static final instance = new LightTheme();

	public function new()
	{
		super();
		styles = {
			backgroundColor: 0xFFE8E8E8,
			textColor: 0xFF1a1a1a,
			hoverColor: 0xFFD0D0D0,
			activeColor: 0xFFF5F5F5,
			borderColor: 0xFFCCCCCC,
			disabledColor: 0xFFA0A0A0,
			accentColor: 0xFF2980b9
		}
	}
}

class BlueTheme extends Theme
{
	public static final instance = new BlueTheme();

	public function new()
	{
		super();
		styles = {
			backgroundColor: 0xFF2C3E50,
			textColor: 0xFFFFFFFF,
			hoverColor: 0xFF34495E,
			activeColor: 0xFF1A252F,
			borderColor: 0xFF000000,
			disabledColor: 0xFF7F8C8D,
			accentColor: 0xFF3498db
		}
	}
}
