package lemonui.utils;

import lemonui.elements.Dropdown;
import flixel.FlxBasic;
import flixel.FlxG;
import lemonui.elements.TextInput;
import flixel.FlxSprite;
import lemonui.elements.MenuItem;
import lemonui.elements.Menu;
import lemonui.elements.MenuBar;
import lemonui.core.ElementBase;

typedef ObjectComponent = {
	var id:String;
	var type:String;
	var ?text:String;
	var ?children:Array<ObjectComponent>;
}

class ElementUtil {

	public static var anythingFocused(get, never):Bool;
	public static var anythingOpened(get, never):Bool;

	static function checkFocused(element:FlxBasic):Bool {
		try {
			var casted = cast (element, ElementBase);
			var out = false;
			try {
				if (cast (casted, TextInput).hasFocus) out = true;
			} catch (_) { /* Do Nothing */}
			for (i in (casted.members ?? [])) {
				if (checkFocused(i)) out = true;
			}
			return out;
		} catch (_) {
			return false;
		}
	}

	static function get_anythingFocused():Bool {
		var out = false;
		for (i in FlxG.state.members) {
			if (checkFocused(i)) out = true;
		}
		return out;
	}

	static function checkOpened(element:FlxBasic):Bool {
		try {
			var casted = cast (element, ElementBase);
			var out = false;
			try {
				if (cast (casted, Menu).isOpen) out = true;
			} catch (_) { /* Do Nothing */}
			try {
				if (cast (casted, Dropdown).isOpen) out = true;
			} catch (_) { /* Do Nothing */}
			for (i in (casted.members ?? [])) {
				if (checkOpened(i)) out = true;
			}
			return out;
		} catch (_) {
			return false;
		}
	}

	static function get_anythingOpened():Bool {
		var out = false;
		for (i in FlxG.state.members) {
			if (checkOpened(i)) out = true;
		}
		return out;
	}

	public static var example:ObjectComponent = {
		id: 'test',
		type: 'MenuBar',
		children: [
			{
				id: 'fileMenu',
				text: 'Test Menu',
				type: 'Menu',
				children: [{
					id: 'test',
					text: 'Test Item',
					type: 'MenuItem'
				}]
			}
		]
	}

	public static function buildFromObject(object:ObjectComponent):ElementBase {
		var component:ElementBase = new ElementBase();
		switch (object.type) {
			case 'MenuBar':
				component = new MenuBar(0, 0);
			case 'Menu':
				component = new Menu(object.text);
			case 'MenuItem':
				component = new MenuItem(object.text);
			default:
				trace('Unknown ui element typed "${object.type}"');
		}
		for (i in object?.children ?? []) {
			component.addElement(buildFromObject(i));
		}
		return component;
	}

	public static function buildFromXML(xmlPath:String, ?handlers:Dynamic):lemonui.xml.XMLResult {
		return lemonui.xml.XMLBuilder.buildFromAsset(xmlPath, handlers);
	}

}