package lemonui.themes;

import flixel.util.FlxColor;
import flixel.util.FlxSignal;

class ThemeManager {
    public static var onThemeChange:FlxSignal = new FlxSignal();
    public static var currentTheme(default, set):Theme = Theme.defaultTheme;
    inline static function set_currentTheme(value:Theme):Theme {
        currentTheme = value;
        onThemeChange.dispatch();
        return currentTheme;
    }

    public static var backgroundColor(get, never):FlxColor;
    public static var textColor(get, never):FlxColor;
    public static var hoverColor(get, never):FlxColor;
    public static var activeColor(get, never):FlxColor;
    public static var borderColor(get, never):FlxColor;
    public static var disabledColor(get, never):FlxColor;
    public static var accentColor(get, never):FlxColor;
    public static var fontRegular(get, never):String;
    public static var fontBold(get, never):String;
    public static var fontSize(get, never):Int;
    public static var titleSize(get, never):Int;
    public static var smallSize(get, never):Int;

    static function get_backgroundColor():FlxColor return currentTheme.styles.backgroundColor;
    static function get_textColor():FlxColor return currentTheme.styles.textColor;
    static function get_hoverColor():FlxColor return currentTheme.styles.hoverColor;
    static function get_activeColor():FlxColor return currentTheme.styles.activeColor;
    static function get_borderColor():FlxColor return currentTheme.styles.borderColor;
    static function get_disabledColor():FlxColor return currentTheme.styles.disabledColor;
    static function get_accentColor():FlxColor return currentTheme.styles.accentColor;
    static function get_fontRegular():String return currentTheme.styles.fontRegular;
    static function get_fontBold():String return currentTheme.styles.fontBold;
    static function get_fontSize():Int return currentTheme.styles.fontSize;
    static function get_titleSize():Int return currentTheme.styles.titleSize;
    static function get_smallSize():Int return currentTheme.styles.smallSize;

    public static function createTheme(?backgroundColor:FlxColor, ?textColor:FlxColor, ?hoverColor:FlxColor, ?activeColor:FlxColor, ?borderColor:FlxColor, ?disabledColor:FlxColor, ?accentColor:FlxColor, ?fontRegular:String, ?fontBold:String, ?fontSize:Int, ?titleSize:Int, ?smallSize:Int):Theme {
        var theme = new Theme();
        if (backgroundColor != null) theme.styles.backgroundColor = backgroundColor;
        if (textColor != null) theme.styles.textColor = textColor;
        if (hoverColor != null) theme.styles.hoverColor = hoverColor;
        if (activeColor != null) theme.styles.activeColor = activeColor;
        if (borderColor != null) theme.styles.borderColor = borderColor;
        if (disabledColor != null) theme.styles.disabledColor = disabledColor;
        if (accentColor != null) theme.styles.accentColor = accentColor;
        if (fontRegular != null) theme.styles.fontRegular = fontRegular;
        if (fontBold != null) theme.styles.fontBold = fontBold;
        if (fontSize != null) theme.styles.fontSize = fontSize;
        if (titleSize != null) theme.styles.titleSize = titleSize;
        if (smallSize != null) theme.styles.smallSize = smallSize;
        return theme;
    }
}