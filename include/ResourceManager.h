#include <GL/glew.h>
#include <tglm/tglm.h>
#import <ObjFW/ObjFW.h>
#import "Shader.h"
#import "Texture2D.h"

@interface ResourceManager : OFObject 

+ (Shader*)LoadShader:(OFString*)vShaderFile withFrag:(OFString*)fShaderFile withName:(OFString*)name;
+ (Shader*)GetShader:(OFString*)name;
+ (Texture2D*)LoadTexture:(OFString*)file withAlpha:(bool)alpha withName:(OFString*)name;
+ (Texture2D*)GetTexture:(OFString*)name;

@end
