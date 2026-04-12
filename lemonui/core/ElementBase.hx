package lemonui.core;

import flixel.FlxG;
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

    static var _initialized:Bool = false;

    public static function initThemeListeners() {
        if (_initialized) return;
        _initialized = true;
        ThemeManager.onThemeChange.add(applyThemeToAll);
    }

    static function applyThemeToAll() {
        if (FlxG.state == null) {
            return;
        }
        var allMembers = FlxG.state.members;
        for (obj in allMembers) {
            if (obj != null) {
                applyThemeRecursive(obj);
            }
        }
    }

    static function applyThemeRecursive(obj:flixel.FlxBasic) {
        if (Std.isOfType(obj, ElementBase)) {
            var el:ElementBase = cast obj;
            el.elementColor = ThemeManager.backgroundColor;
        }
        if (Std.isOfType(obj, FlxSpriteGroup)) {
            var group:FlxSpriteGroup = cast obj;
            for (member in group.members) {
                if (member != null) applyThemeRecursive(member);
            }
        }
    }

    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
        initThemeListeners();
    }
}