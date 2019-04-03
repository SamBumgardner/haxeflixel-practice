package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Sam
 */
class Hero extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		this.makeGraphic(25, 25);
		
		this.velocity.set(FlxG.random.int(-20, 20), FlxG.random.int(-20, 20));
	}
	
	override public function update(elapsed:Float):Void
	{
		this.color = 0xffffff & (((Std.int(this.y) % 255) << 16 ) + ((Std.int(this.x) % 255) << 8) + ((Std.int(this.x) + Std.int(this.y)) % 255));
				
		super.update(elapsed);
	}
	
}