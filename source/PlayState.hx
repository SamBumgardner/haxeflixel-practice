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
	
	private var FIREBALL_START_X(default, never):Int = 400;
	private var FIREBALL_START_Y(default, never):Int = 270;
	private var FIREBALL_START_VELOCITY_X(default, never):Int = -50;
	
	// It's a good idea to keep these as instance variables so we can reference
	//  them inisde our update function.
	public var groundGrp:FlxGroup;
	public var hero:Hero;
	public var fireball:Fireball;
	
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
		
		fireball = new Fireball(FIREBALL_START_X, FIREBALL_START_Y, FIREBALL_START_VELOCITY_X);
		add(fireball);
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
		
		// Here we use FlxG.overlap to do custom logic when overlap occurs.
		FlxG.overlap(hero, fireball, collideHeroAndFireball);
		
		//////////////////////
		// Other game logic //
		//////////////////////
		
		// For our convenience, let's reset the hero whenever killed or taken off-screen.
		if (!hero.alive || !hero.isOnScreen()) {
			hero.reset(HERO_START_X, HERO_START_Y);
		}
		
		// For our convenience, let's reset the fireball whenever killed or taken off-screen.
		if (!fireball.alive || !fireball.isOnScreen()) {
			fireball.reset(FIREBALL_START_X, FIREBALL_START_Y);
			fireball.velocity.x = FIREBALL_START_VELOCITY_X;
		}
	}
	
	/**
	 * Basic overlap resolution function - when a hero and fireball overlap, both are killed.
	 * @param	hero
	 * @param	fireball
	 */
	private function collideHeroAndFireball(hero:Hero, fireball:Fireball):Void
	{
		hero.kill();
		fireball.kill();
	}
}
