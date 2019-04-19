#import <ResourceManager.h>

@implementation ResourceManager

static OFMutableDictionary* _Shaders = nil;
static OFMutableDictionary* _Textures = nil;

+ (void)initialize {
    if (self == [ResourceManager class]) {
        _Shaders = [OFMutableDictionary dictionary];
        _Textures = [OFMutableDictionary dictionary];
    }
}

+ (OFMutableDictionary*)Shaders {
    return _Shaders;
}

+ (OFMutableDictionary*)Textures {
    return _Textures;
}

/**
 * loadShaderFromFile
 * 
 * @param vShaderFile path to vertex shader
 * @param fShaderFile path to fragment shader
 * @returns loaded, compiled and linked shader program
 * 
 */
+ (Shader*)loadShaderFromFile:(OFString*)vShaderFile:(OFString*)fShaderFile {

    // 1. Retrieve the vertex/fragment source code from filePath
    // char* vertexCode;
    // char* fragmentCode;
    // Open files
    char vFile[1024];
    strcpy(vFile, "assets/");
    strcat(vFile, vShaderFile.UTF8String);

    char fFile[1024];
    strcpy(fFile, "assets/");
    strcat(fFile, fShaderFile.UTF8String);
    
    FILE* vertexShaderFile = fopen(vFile, "r");
    FILE* fragmentShaderFile = fopen(fFile, "r");

    if (!vertexShaderFile) OFLog(@"Unable to open %@", vShaderFile);
    if (!fragmentShaderFile) OFLog(@"Unable to open %@", fShaderFile);

    // Read file's buffer contents into streams
    const GLchar *vShaderCode = [ResourceManager rdbuf:vertexShaderFile];
    const GLchar *fShaderCode = [ResourceManager rdbuf:fragmentShaderFile];
    // close file handlers
    fclose(vertexShaderFile);
    fclose(fragmentShaderFile);

    // 2. Now create shader object from source code
    Shader* shader = [[Shader alloc]init];
    [shader Compile:vShaderCode:fShaderCode];
    return shader;
}

/**
 * loadTextureFromFile
 * 
 * @param file path to texture
 * @param alpha does the texture have an alpha channel?
 * @returns Texture
 * 
 */
+ (Texture2D*)loadTextureFromFile:(OFString*)file:(bool)alpha {

    // Create Texture object
    int format = alpha ? GL_RGBA : GL_RGB;
    char path[1024];
    strcpy(path, "assets/");
    strcat(path, file.UTF8String);
    OFLog(@"file %@", file);
    OFLog("path %s", path);
    int width, height, channels;
    
    Texture2D* texture = [[Texture2D alloc]initWithFormat:format Image:format Path:path];
    // Load image
    unsigned char* image = stbi_load(path, &width, &height, &channels, 0); //texture->ImageFormat == GL_RGBA ? 4 : 3);
    // generate texture
    [texture Generate:width Height:height Data:image];
    // And then free image data
    // stbi_image_free(image);
    return texture;
}

/**
 * ReadTextFile
 * 
 * @param path path to file
 * @returns string with file contents
 * 
 */
+ (char*)rdbuf:(FILE*)f {
    fseek(f, 0L, SEEK_END);
    long s = ftell(f);
    rewind(f);
    char* buf = malloc(s+1);
    buf[s] = '\0';

    if (buf != nil)
    {
        fread(buf, s, 1, f);
        return buf;
    }
    return buf;
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
    ResourceManager.Shaders[name] = [ResourceManager loadShaderFromFile:vertexShaderFile:fragmentShaderFile];
    Shader* sh = ResourceManager.Shaders[name];
    return sh;
                     
}

/**
 * GetShader
 * 
 * @param name to retrieve
 * @returns loaded, compiled and linked shader program
 * 
 */
+ (Shader*)GetShader:(OFString*)name {
    return ResourceManager.Shaders[name];
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
    Texture2D* tex = [ResourceManager loadTextureFromFile:file:alpha];
    ResourceManager.Textures[name] = tex;
    return tex;

}

/**
 * GetTexture
 * 
 * @param name to retrieve
 * @returns Texture
 * 
 */
+ (Texture2D*)GetTexture:(OFString*)name {
    return ResourceManager.Textures[name];
}

@end