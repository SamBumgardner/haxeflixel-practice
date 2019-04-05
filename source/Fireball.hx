package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * Very simple class, used to demonstrate how FlxG.overlap can be used.
 * @author Samuel Bumgardner
 */
class Fireball extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?initialVelocityX:Float = 0, ?initialVelocityY:Float = 0) 
	{
		super(X, Y);
		this.makeGraphic(15, 15, FlxColor.RED);
		
		this.velocity.set(initialVelocityX, initialVelocityY);
	}
}