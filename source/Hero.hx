package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * Our player-controlled hero class. 
 * @author Sam
 */
class Hero extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		// Call parent constructor to do basic FlxSprite setup
		super(X, Y, SimpleGraphic);
		
		// Create basic rectangle graphic
		this.makeGraphic(25, 25, FlxColor.ORANGE);
		
		// Set acceleration and max velocity to represent gravity.
		this.acceleration.y = 50;
		this.maxVelocity.y = 200;
		
		// Set max velocity for x to limit speed of character
		this.maxVelocity.x = 200;
	}
	
	override public function update(elapsed:Float):Void
	{
		//////////////////////////
		// Basic input handling //
		//////////////////////////
		
		// FlxG.keys.pressed values are booleans.
		//  They indicate what keys are currently held down.
		var leftPressed:Bool = FlxG.keys.pressed.LEFT;
		var rightPressed:Bool = FlxG.keys.pressed.RIGHT;
		
		// FlxG.keys.justPressed values are reset each update().
		//  This makes it good for inputs that need to be pressed, not held.
		var spaceJustPressed:Bool = FlxG.keys.justPressed.SPACE;
		
		// Here are some *very* basic examples of how to respond to input.
		//  You can do a lot more here to make the game feel much better.
		if (leftPressed) { // Move left
			this.acceleration.x = -50;
		} 
		else if (rightPressed) { // Move right
			this.acceleration.x = 50;
		}
		else { // stop moving
			this.acceleration.x = 0;
			this.velocity.x = 0;
		}
		
		if (spaceJustPressed) { // Jump. Note: no restrictions that prevent infinite jumping.
			this.velocity.y = -100;
		}
		
		
		/////////////////////////
		// Normal update stuff //
		/////////////////////////
		
		// Call parent update, which will apply all physics, animations, etc.
		super.update(elapsed);
	}
	
}