#import <Texture2D.h>

@implementation Texture2D

/**
 * Texture2D
 * 
 * @param InternalFormat for binding the image
 * @param ImageFormat for binding the image
 * 
 */
- (instancetype)initWithFormat:(int)format 
                         Image:(int)image 
                          Path:(OFString*)path {
    if ((self = [super init])) {
        self.InternalFormat = format;
        self.ImageFormat = image;
        self.Path = path;
        self.Width = 0;
        self.Height = 0;
        self.WrapS = GL_REPEAT;
        self.WrapT = GL_REPEAT;
        self.FilterMin = GL_LINEAR;
        self.FilterMag = GL_LINEAR;
        glEnable(GL_TEXTURE_2D);
        glGenTextures(1, &_Id);
    }
    return self;

}

- (OFString*)ToString {
    return @"Texture2D";
}

/**
 * Generate
 * 
 * @param width of image to generate
 * @param height of image to generate
 * @param data bitmap data
 * 
 */
- (void)Generate:(GLuint)width 
         Height:(GLuint)height 
            Data:(unsigned char*)data {
    self.Width = width;
    self.Height = height;
    // Create Texture
    glBindTexture(GL_TEXTURE_2D, self.Id);
    OFLog("Generate before %d", self.Id);
    glTexImage2D(GL_TEXTURE_2D, 0, self.InternalFormat, width, height, 0, self.ImageFormat, GL_UNSIGNED_BYTE, data);
    OFLog("Generate after");
    // Set Texture wrap and filter modes
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, self.WrapS);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, self.WrapT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, self.FilterMin);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, self.FilterMag);
    // Unbind texture
    glBindTexture(GL_TEXTURE_2D, 0);

}

- (void)Bind {
    glBindTexture(GL_TEXTURE_2D, self.Id);
}

@end