package lemonui.xml;

import flixel.FlxSprite;
import lemonui.core.ElementBase;

using StringTools;

class XMLResult {

	public var root:ElementBase;

	var idMap:Map<String, FlxSprite> = new Map();
	var classMap:Map<String, Array<FlxSprite>> = new Map();

	public function new(root:ElementBase) {
		this.root = root;
	}

	public function register(id:Null<String>, classes:Null<String>, element:FlxSprite) {
		if (id != null) idMap.set(id, element);
		if (classes != null) {
			for (cls in classes.split(' ')) {
				var trimmed = StringTools.trim(cls);
				if (trimmed.length == 0) continue;
				if (!classMap.exists(trimmed)) classMap.set(trimmed, []);
				classMap.get(trimmed).push(element);
			}
		}
	}

	public function get(id:String):FlxSprite {
		return idMap.get(id);
	}

	public function getByClass(cls:String):Array<FlxSprite> {
		if (classMap.exists(cls)) return classMap.get(cls);
		return [];
	}

}