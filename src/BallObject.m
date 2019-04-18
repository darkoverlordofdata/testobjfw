#import <BallObject.h>

@implementation BallObject

/**
 * BallObject
 * 
 * @param Position initial placement of ball 
 * @param Radius size of ball
 * @param Velocity initial speed of ball
 * @param Sprite to display
 */
- (instancetype)initWithPos:(Vec2)pos 
                     Radius:(float)radius 
                   Velocity:(Vec2)vel 
                     Sprite:(Texture2D*)sprite {
    radius = radius != 0 ? radius : 12.5f;
    Vec2 size = (Vec2){ radius*2, radius*2 };
    Vec3 color = (Vec3){ 1, 1, 1 };
    if ((self = [super initWithName:@"ball" Pos:pos Size:size Sprite:sprite Color:color])) 
    {
        self.Velocity = vel;
        self.Radius = radius;
    }
    return self;
}

- (OFString*)ToString {
    return @"BallObject";
}

/**
 * Draw
 * 
 * @param renderer to draw sprite with
 */
- (void)Draw:(SpriteRenderer*)renderer {

}

/**
 * Move
 * 
 * @param dt delta time
 * @param window_width
 * @returns Vec2 new position
 */
// - (void)Move:(GLfloat)dt 
//        Width:(GLuint)width {
- (void)Move:(GLfloat)dt:(GLuint)width {

}

/**
 * Resets the ball to initial Stuck Position (if ball is outside window bounds)
 * 
 * @param position to reset to
 * @param velocity to reset to
 * 
 */
- (void)Reset:(Vec2)position:(Vec2)velocity {

}

@end