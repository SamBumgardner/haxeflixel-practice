package;

import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	public var groundGrp:FlxGroup;
	
	override public function create():Void
	{
		super.create();
		
		groundGrp = new FlxGroup();
		for (i in 0...10) {
			groundGrp.add(new Ground(100 + 32 * i, 100));
		}
		add(groundGrp);
		
		var text = new FlxText(0, 0, 0, "hello world", 64);
		text.screenCenter();
		add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
