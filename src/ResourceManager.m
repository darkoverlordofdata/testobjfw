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

+ (Shader*)LoadShader:(OFString*)vShaderFile withFrag:(OFString*)fShaderFile withName:(OFString*)name {
    return nil;
}

+ (Shader*)GetShader:(OFString*)name {
    return nil;

}

+ (Texture2D*)LoadTexture:(OFString*)file withAlpha:(bool)alpha withName:(OFString*)name {
    return nil;

}

+ (Texture2D*)GetTexture:(OFString*)name {
    return nil;

}

@end