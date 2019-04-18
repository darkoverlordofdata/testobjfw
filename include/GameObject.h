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
@property Vec2 Position; 
@property Vec2 Size;
@property Vec2 Velocity;
@property Vec3 Color;
@property GLfloat Rotation;
@property GLboolean IsSolid;
@property GLboolean Destroyed;
@property Texture2D* Sprite;	
@property OFString* Name;

- (instancetype)initWithName:(OFString*)name 
                    Position:(Vec2)pos 
                        Size:(Vec2)size 
                      Sprite:(Texture2D*)sprite 
                       Color:(Vec3)color;
- (OFString*)ToString;
- (void)Draw:(SpriteRenderer*)renderer;


@end
