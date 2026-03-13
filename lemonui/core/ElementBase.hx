package lemonui.core;

import flixel.util.FlxColor;

class ElementBase extends flixel.group.FlxSpriteGroup {

    public var componentColor(default, set):FlxColor = 0xFF3d3f41;
    function set_componentColor(value:FlxColor) {
        onColorChange(value);
        return componentColor = value;
    }

    public function onColorChange(value:FlxColor) {}

    public function addComponent(component:ElementBase) {
        add(component);
    }

}