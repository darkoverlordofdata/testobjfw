#import <GL/glew.h>
#import <tglm/tglm.h>
#import <Foundation/Foundation.h>

@interface Texture2D : OFObject 
@property GLuint Id;
@property OFString* Path;
                                // Texture image dimensions
@property GLuint Width;
@property GLuint Height;        // Width and height of loaded image in pixels
                                // Texture Format
@property GLuint InternalFormat;// Format of texture object
@property GLuint ImageFormat;   // Format of loaded image
                                // Texture configuration
@property GLuint WrapS;         // Wrapping mode on S axis
@property GLuint WrapT;         // Wrapping mode on T axis
@property GLuint FilterMin;     // Filtering mode if texture pixels < screen pixels
@property GLuint FilterMag;     // Filtering mode if texture pixels > screen pixels

- (instancetype)initWithFormat:(int)format 
                         Image:(int)image 
                          Path:(OFString*)path;

- (OFString*)ToString;
- (void)Generate:(GLuint)width 
          Height:(GLuint)height 
            Data:(unsigned char*)data;
- (void)Bind;

@end
