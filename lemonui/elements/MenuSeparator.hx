package lemonui.elements;

import flixel.util.FlxColor;

class MenuSeparator extends MenuItem {

	override public function new(width:Int = 300, height:Int = 2) {
		super(width, height, '');
		this.buttonText.visible = false;
		this.elementColor = FlxColor.interpolate(elementColor, FlxColor.BLACK, 0.25);
		background.makeGraphic(width, height, elementColor);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		this.hoverSprite.visible = false;
	}

}