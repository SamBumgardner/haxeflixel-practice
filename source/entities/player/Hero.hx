package entities.player;

import entities.projectiles.Fireball;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Hero extends FlxSprite {

    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(32, 32, FlxColor.WHITE);
    }

    override function update(elapsed:Float) {
        // Add code here to respond to player input.
        if (FlxG.keys.justPressed.A) {
            trace("The A key was pressed.");
        }

        if (FlxG.keys.justPressed.DOWN) {
            velocity.y += 50;
        }
        if (FlxG.keys.justReleased.DOWN) {
            velocity.y += -50;
        }

        if (FlxG.keys.justPressed.UP) {
            velocity.y += -50;
        }
        if (FlxG.keys.justReleased.UP) {
            velocity.y += 50;
        }

        if (FlxG.keys.justPressed.CONTROL) {
            var fireball:Fireball = new Fireball(x, y);
            
            FlxG.state.add(fireball);
        }

        super.update(elapsed);
    }
}