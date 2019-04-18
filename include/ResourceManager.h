#import <GL/glew.h>
#import <tglm/tglm.h>
#import <Foundation/Foundation.h>
#import "Shader.h"
#import "Texture2D.h"

@interface ResourceManager : OFObject 

+ (Shader*)LoadShader:(OFString*)name 
               Vertex:(OFString*)vertexShaderFile 
                 Frag:(OFString*)fragmentShaderFile;
+ (Shader*)GetShader:(OFString*)name;
+ (Texture2D*)LoadTexture:(OFString*)name 
                     Path:(OFString*)file 
                    Alpha:(bool)alpha;
+ (Texture2D*)GetTexture:(OFString*)name;

@property (class, nonatomic, readonly) OFDictionary* shaders;
@property (class, nonatomic, readonly) OFDictionary* textures;

@end
