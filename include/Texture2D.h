#include <GL/glew.h>
#include <tglm/tglm.h>
#import <ObjFW/ObjFW.h>

@interface Texture2D : OFObject 

- (id)initWithFormat:(int)format ImageFormat:(int)image Path:(OFString*)path;

@property GLuint Id;
@property char* path;
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
@end
