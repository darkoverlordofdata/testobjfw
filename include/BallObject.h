#include <GL/glew.h>
#include <tglm/tglm.h>
#import <ObjFW/ObjFW.h>
#import "GameObject.h"


@interface BallObject : GameObject 

- (id)initWithPos:(Vec2)pos withRadius:(float)radius withVelocity:(Vec2)vel withSprite:(Texture2D*)sprite;
- (OFString*)ToString;
- (void)Draw:(SpriteRenderer*)renderer;
- (void)Move:(GLfloat) dt withWidth:(GLuint)width;
- (void)Reset:(Vec2)pos withVelocity:(Vec2)vel;

@property float   Radius;
@property bool    Stuck;

@end
