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

+ (Shader*)loadShaderFromFile:(OFString*)vShaderFile:(OFString*)fShaderFile;
+ (Texture2D*)loadTextureFromFile:(OFString*)file:(bool)alpha;
+ (char*)rdbuf:(FILE*)f;


@property (class, nonatomic, readonly) OFMutableDictionary* Shaders;
@property (class, nonatomic, readonly) OFMutableDictionary* Textures;

@end
