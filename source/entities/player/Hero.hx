package entities.player;

import flixel.system.FlxSound;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Hero extends FlxSprite {
    public static var SPRITE_WIDTH(default, never):Int = 32;
    public static var SPRITE_HEIGHT(default, never):Int = 32;

    public static var WIDTH(default, never):Int = 10;
    public static var HEIGHT(default, never):Int = 32;
    public static var X_OFFSET(default, never):Int = 11;

    public static var GRAVITY(default, never):Float = 300;
    public static var TERMINAL_VELOCITY(default, never):Float = 600;
    public static var X_SPEED(default, never):Float = 200;

    public static var JUMP_SPEED(default, never):Float = -200;

    public static var STAND_ANIMATION:String = "stand";
    public static var WALK_ANIMATION:String = "walk";

    private var leftInput:Bool = false;
    private var rightInput:Bool = false;
    private var jumpInput:Bool = false;
    
    private var deathSound:FlxSound;

    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(SPRITE_WIDTH, SPRITE_HEIGHT, FlxColor.WHITE);
        
        // Load and initialize animation information for "fancy" graphic.
        // loadGraphic(AssetPaths.BadRobot__png, true, SPRITE_WIDTH, SPRITE_HEIGHT);
        // animation.add(STAND_ANIMATION, [0], 0, false);
        // animation.add(WALK_ANIMATION, [1, 0, 2, 0], 5);

        // animation.play(STAND_ANIMATION);

        // Resize physical width and height to match the visual appearance.
        // width = WIDTH;
        // height = HEIGHT;
        // offset.x = X_OFFSET;

        // Set up "gravity" (constant acceleration) and "terminal velocity" (max fall speed)
        acceleration.y = GRAVITY;
        maxVelocity.y = TERMINAL_VELOCITY;

        // Load sounds
        // deathSound = FlxG.sound.load(AssetPaths.sam_ow__wav);
    }

    override function update(elapsed:Float) {
        // Set up nicer input-handling for movement.
        gatherInputs();

        // Horizontal movement
        var direction:Int = getMoveDirectionCoefficient(leftInput, rightInput);
        velocity.x = X_SPEED * direction;
        // if (direction < 0) {
        //     flipX = true;
        //     animation.play(WALK_ANIMATION);
        // } else if (direction > 0) {
        //     flipX = false;
        //     animation.play(WALK_ANIMATION);
        // } else {
        //     animation.play(STAND_ANIMATION);
        // }
        
        // Jump
        jump(jumpInput);

        super.update(elapsed);
    }

    /**
        Helper function responsible for interacting with HaxeFlixel systems to gather inputs 
        relevant to the Hero. Helps keep code clean by restricting FlxG.keys input to a single spot,
        which makes it much easier to change inputs, implement rebinding, etc. in the future.
    **/
    private function gatherInputs():Void {
        leftInput = FlxG.keys.pressed.LEFT;
        rightInput = FlxG.keys.pressed.RIGHT;

        jumpInput = FlxG.keys.justPressed.Z;
    }

    /**
        Uses player input to determine if movement should occur in a positive or negative X 
        direction. If no movement inputs are detected, 0 is returned instead.
        @param leftPressed Boolean indicating if the "left" movement button is pressed.
        @param rightPressed Boolean indicating if the "right" movement button is pressed.
        @return Returns 1, 0, or -1. Multiply movement speed by this to set movement direction.
    **/
    private function getMoveDirectionCoefficient(leftPressed:Bool, rightPressed:Bool):Int {
        var finalDirection:Int = 0;        
        if (leftPressed) {
            finalDirection--;
        }
        if (rightPressed) {
            finalDirection++;
        }
        return finalDirection;
    }

    /**
        Simple function for handling jump logic.
        At the moment, this doesn't prevent the player from jumping while in the air.
        @param jumpJustPressed Boolean indicating if the jump button was pressed this frame.
    **/
    private function jump(jumpJustPressed:Bool):Void {
        if (jumpJustPressed) {
            velocity.y = JUMP_SPEED;
        }
    }

    /**
        Simple override of kill, adds in our own custom death sound.
    **/
    override function kill() {
        super.kill();
        // deathSound.play();
    }
}