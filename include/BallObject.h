#import <GL/glew.h>
#import <tglm/tglm.h>
#import <Foundation/Foundation.h>
#import "GameObject.h"


@interface BallObject : GameObject 
@property float   Radius;
@property bool    Stuck;

- (instancetype)initWithPos:(Vec2)pos 
                     Radius:(float)radius 
                   Velocity:(Vec2)vel 
                     Sprite:(Texture2D*)sprite;
- (OFString*)ToString;
- (void)Draw:(SpriteRenderer*)renderer;
- (void)Move:(GLfloat)dt:(GLuint)width;
- (void)Reset:(Vec2)position:(Vec2)velocity;

@end
