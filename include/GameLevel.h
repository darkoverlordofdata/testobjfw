#include <GL/glew.h>
#include <tglm/tglm.h>
#import <ObjFW/ObjFW.h>
#import "Game.h"
#import "Texture2D.h"
#import "SpriteRenderer.h"
#import "ResourceManager.h"
#import "GameObject.h"

/**
 * BlockType tint color
 */
static const Vec3 COLOR0 = { 0.8f, 0.8f, 0.7f };
static const Vec3 COLOR1 = { 0.2f, 0.6f, 1.0f };
static const Vec3 COLOR2 = { 0.0f, 0.7f, 0.0f };
static const Vec3 COLOR3 = { 0.8f, 0.8f, 0.4f };
static const Vec3 COLOR4 = { 1.0f, 0.5f, 0.0f };
static const Vec3 COLOR5 = { 1.0f, 1.0f, 1.0f };

@interface GameLevel : OFObject 
- (id)initWithFile:(GLchar*)path withWidth:(int)width withHeight:(int)height;
- (OFString*)ToString;
- (id)Load:(GLchar*)path withWidth:(int)width withHeight:(int)height;
- (void)Draw:(SpriteRenderer*)renderer;
- (bool)IsCompleted;

@property OFArray* Bricks; 
@end
