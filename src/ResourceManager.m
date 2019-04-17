#import <ResourceManager.h>

@implementation ResourceManager

+ (Shader*)LoadShader:(OFString*)vShaderFile withFrag:(OFString*)fShaderFile withName:(OFString*)name {
    return NULL;
}

+ (Shader*)GetShader:(OFString*)name {
    return NULL;

}

+ (Texture2D*)LoadTexture:(OFString*)file withAlpha:(bool)alpha withName:(OFString*)name {
    return NULL;

}

+ (Texture2D*)GetTexture:(OFString*)name {
    return NULL;

}

@end