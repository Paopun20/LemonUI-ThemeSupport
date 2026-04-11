package lemonui.elements;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import lemonui.core.ElementBase;

import lemonui.themes.ThemeManager;

class Text extends ElementBase {

	public var textObj:FlxText;

	public function new (text:String) {
		super();
		textObj = new FlxText(5, 5, 0, text);
		textObj.font = ThemeManager.fontBold;
		textObj.size = Math.round(13*1.75);
		textObj.scale.x = textObj.scale.y /= 1.75;
		textObj.updateHitbox();
		add(textObj);
	}

	override function onColorChange(value:FlxColor) {
		super.onColorChange(value);
		if (textObj != null) textObj.color = FlxColor.interpolate(value, FlxColor.WHITE, 0.85);
	}

}