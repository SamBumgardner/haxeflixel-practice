package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	public var groundGrp:FlxGroup;
	public var hero:Hero;
	
	override public function create():Void
	{
		super.create();
		
		groundGrp = new FlxGroup();
		for (i in 0...10) {
			groundGrp.add(new Ground(100 + 32 * i, 100));
		}
		add(groundGrp);
		
		hero = new Hero(150, 50);
		add(spr);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
