#import <ResourceManager.h>

@implementation ResourceManager

static OFDictionary* _shaders = nil;
static OFDictionary* _textures = nil;

+ (void)initialize {
    if (self == [ResourceManager class]) {
        _shaders = [OFDictionary dictionary];
        _textures = [OFDictionary dictionary];
    }
}

+ (OFDictionary*)shaders {
    return _shaders;
}

+ (OFDictionary*)textures {
    return _textures;
}

/**
 * LoadShader
 * 
 * @param vShaderFile path to vertex shader
 * @param fShaderFile path to fragment shader
 * @param name to cache as
 * @returns loaded, compiled and linked shader program
 */
+ (Shader*)LoadShader:(OFString*)name 
               Vertex:(OFString*)vertexShaderFile 
                 Frag:(OFString*)fragmentShaderFile {
    return nil;
}

/**
 * GetShader
 * 
 * @param name to retrieve
 * @returns loaded, compiled and linked shader program
 * 
 */
+ (Shader*)GetShader:(OFString*)name {
    return self.shaders[name];
}

/**
 * loadTextureFromFile
 * 
 * @param file path to texture
 * @param alpha does the texture have an alpha channel?
 * @param name to cache as
 * @returns Texture
 * 
 */
+ (Texture2D*)LoadTexture:(OFString*)name 
                     Path:(OFString*)file 
                    Alpha:(bool)alpha {
    return nil;

}

/**
 * GetTexture
 * 
 * @param name to retrieve
 * @returns Texture
 * 
 */
+ (Texture2D*)GetTexture:(OFString*)name {
    return self.textures[name];
}

@end