package;

import entities.player.Hero;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var hero:Hero;

	override public function create():Void
	{
		super.create();

		hero = new Hero();
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
