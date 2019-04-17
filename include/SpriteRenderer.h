#include <GL/glew.h>
#include <tglm/tglm.h>
#import <ObjFW/ObjFW.h>
#import "Shader.h"
#import "Texture2D.h"


@interface SpriteRenderer : OFObject 

- (id)initWithShader:(Shader*)shader;
- (OFString*)ToString;
- (SpriteRenderer*)Use;
- (void)Draw:(Texture2D*)sprite Pos:(Vec2)pos Size:(Vec2)size Rot:(GLfloat)rot Color:(Vec3)color;

@property Shader* shader; 
@property GLuint VAO;
@end
