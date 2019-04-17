#import <GL/glew.h>
#import <tglm/tglm.h>
#import <Foundation/Foundation.h>
#import "Texture2D.h"
#import "SpriteRenderer.h"

/** Default values */
static const Vec2 GAME_OBJECT_POSITION = { 0.0f, 0.0f };
static const Vec2 GAME_OBJECT_SIZE     = { 1.0f, 1.0f };
static const Vec2 GAME_OBJECT_VELOCITY = { 0.0f, 0.0f };
static const Vec3 GAME_OBJECT_COLOR    = { 1.0f, 1.0f, 1.0f };

@interface GameObject : OFObject 
- (id)initWithName:(OFString*)name withPos:(Vec2)pos withSize:(Vec2)size withSprite:(Texture2D*)sprite withColor:(Vec3)color;
- (OFString*)ToString;
- (void)Draw:(SpriteRenderer*)renderer;

@property Vec2 Position; 
@property Vec2 Size;
@property Vec2 Velocity;
@property Vec3 Color;
@property GLfloat Rotation;
@property GLboolean IsSolid;
@property GLboolean Destroyed;
@property Texture2D* Sprite;	
@property OFString* Name;

@end
