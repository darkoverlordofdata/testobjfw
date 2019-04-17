#import <Texture2D.h>

@implementation Texture2D

- (id)initWithFormat:(int)format ImageFormat:(int)image Path:(OFString*)path {
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

- (void)Generate:(GLuint)width Height:(GLuint)height Data:(unsigned char*)data {

}

- (void)Bind {

}

@end