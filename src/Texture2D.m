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

}

- (void)Bind {

}

@end