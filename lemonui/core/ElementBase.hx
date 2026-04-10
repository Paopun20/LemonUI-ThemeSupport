package lemonui.core;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import lemonui.themes.ThemeManager;

class ElementBase extends FlxSpriteGroup {

    public var parent:ElementBase;

    public var id:String;

    public var elementColor(default, set):FlxColor = ThemeManager.backgroundColor;
    function set_elementColor(value:FlxColor) {
        onColorChange(value);
        return elementColor = value;
    }

    public function onColorChange(value:FlxColor) {}

    public function addElement(component:ElementBase) {
        component.parent = this;
        add(component);
    }

    public function findElement<T>(id:String, doTrace:Bool = true):Null<T> {
        for (i in members) {
            if (Std.isOfType(i, ElementBase)) {
                var el:ElementBase = cast i;
                if (el.id == id) return cast el;
                var out = el.findElement(id, false);
                if (out != null) return cast out;
            }
        }
        if (doTrace) trace('Could not find element with id "$id"');
        return null;
    }

}