#import <GL/glew.h>
#import <tglm/tglm.h>
#import <Foundation/Foundation.h>
#import "Shader.h"
#import "Texture2D.h"


@interface SpriteRenderer : OFObject 
@property Shader* Shader; 
@property GLuint VAO;

- (instancetype)initWithShader:(Shader*)shader;
- (OFString*)ToString;
- (void)Dispose;
- (void)Draw:(Texture2D*)sprite 
         Pos:(Vec2)pos 
        Size:(Vec2)size 
         Rot:(GLfloat)rot 
       Color:(Vec3)color;

@end
