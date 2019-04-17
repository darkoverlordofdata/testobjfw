#import <BallObject.h>

@implementation BallObject

- (id)initWithPos:(Vec2)pos withRadius:(float)radius withVelocity:(Vec2)vel withSprite:(Texture2D*)sprite {
    radius = radius != 0 ? radius : 12.5f;
    Vec2 size = (Vec2){ radius*2, radius*2 };
    Vec3 color = (Vec3){ 1, 1, 1 };
    if ((self = [super initWithName:@"ball" withPos:pos withSize:size withSprite:sprite withColor:color])) 
    {
        self.Velocity = vel;
        self.Radius = radius;
    }
    return self;
}

- (OFString*)ToString {
    return @"BallObject";
}

- (void)Draw:(SpriteRenderer*)renderer {

}

- (void)Move:(GLfloat) dt withWidth:(GLuint)width {

}

- (void)Reset:(Vec2)pos withVelocity:(Vec2)vel {

}

@end