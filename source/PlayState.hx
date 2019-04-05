package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	// I added some constant variables to the class definition.
	// Rather than use random numbers in create(), we can reference
	//  these variables that have some meaning attached to their names. 
	private var TILE_SIZE(default, never):Int = 32;
	
	private var GROUND_POSITION_X(default, never):Int = 100;
	private var GROUND_POSITION_Y(default, never):Int = 300;
	
	private var HERO_START_X(default, never):Int = 150;
	private var HERO_START_Y(default, never):Int = 150;
	
	public var groundGrp:FlxGroup;
	public var hero:Hero;
	
	override public function create():Void
	{
		super.create();
		
		groundGrp = new FlxGroup();
		for (i in 0...10) {
			groundGrp.add(new Ground(GROUND_POSITION_X + TILE_SIZE * i, GROUND_POSITION_Y));
		}
		add(groundGrp);
		
		hero = new Hero(HERO_START_X, HERO_START_Y);
		add(hero);
		
	}

	override public function update(elapsed:Float):Void
	{
		// Let everything update (which lets them move into each other)
		super.update(elapsed);
		
		/////////////////////
		// Collision logic //
		/////////////////////
		
		// FlxG's collide checks for overlap, then separates overlapping objects.
		FlxG.collide(hero, groundGrp);
	}
}
