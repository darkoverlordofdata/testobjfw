#import <Game.h>

@implementation Game

/**
 * Create Game instance
 * 
 * @param Width of screen
 * @param Height of screen
 * 
 */
- (instancetype)initWithWidth:(int)width 
                       Height:(int)height {
    if ((self = [super init])) {
        self.Width = width;
        self.Height = height;
    }
    return self;
}

-(Collision)CollisionTuple:(bool)isTrue:(Direction)dir:(Vec2)vec
{
    Collision tuple = { isTrue, dir, vec };
    return tuple;
}

- (OFString*)ToString {
    return @"Game";

}

/**
 * Start the game
 */
- (void)Start {

}

/**
 * Update
 * 
 * @param dt delta time
 */
- (void)Update:(GLfloat) dt {

}

/**
 * ProcessInput
 * 
 * @param dt delta time
 */
- (void)ProcessInput:(GLfloat) dt {

}

/**
 * Render
 * 
 */
- (void)Render {

}

/**
 * ResetLevel
 * 
 */
- (void)ResetLevel {

}

/**
 * ResetPlayer
 * 
 */
- (void)ResetPlayer {

}

/**
 * Release game resources
 */
- (void)Dispose {

}

/**
 * DoCollisions
 * 
 */
- (void)DoCollisions {

}

- (void)SetKey:(int)key 
         Value:(bool) value {

}

- (void)SetState:(GameState) state {
    self.State = state;
}


@end
