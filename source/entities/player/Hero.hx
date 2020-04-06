package entities.player;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Hero extends FlxSprite {

    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(32, 32, FlxColor.WHITE);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);

        // Add code here to respond to player input.
    }
}