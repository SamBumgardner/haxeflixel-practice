package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * Simple class to represent immovable terrain (in this case, the ground).
 * 
 * Using FlxSprite like this isn't actually very performant, it's better to
 *  use some sort of tilemap to represent static terrain.
 * @author Sam
 */
class Ground extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		// Basic setup, should be familiar now.
		super(X, Y, SimpleGraphic);
		this.makeGraphic(32, 32, FlxColor.GRAY);
		
		// immovable is a property of FlxSprite used by Haxeflixel's built-in
		//  collision-resolving system. Setting it to true means it can't be
		//  pushed around by other objects.
		this.set_immovable(true);
	}
	
}