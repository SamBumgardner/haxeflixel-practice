package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var text = new FlxText(0, 0, 0, "hello world", 64);
		text.screenCenter();
		add(text);
		
		for (i in 0...15) {
			var spr = new Hero(200, 200);
			add(spr);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
