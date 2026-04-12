package lemonui.elements;

import flixel.text.FlxText;
import lemonui.core.ElementBase;

class Text extends ElementBase {
    public function new (text:String) {
        super();
        var textObj = new FlxText(5, 5, 0, text);
        textObj.font = Constants.FONT_BOLD;
        textObj.size = Math.round(13*1.75);
        textObj.scale.x = textObj.scale.y /= 1.75;
        textObj.updateHitbox();
        add(textObj);
    }
}