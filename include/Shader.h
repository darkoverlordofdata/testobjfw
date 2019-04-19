#import <GL/glew.h>
#import <tglm/tglm.h>
#import <Foundation/Foundation.h>

@interface Shader : OFObject 
@property GLuint Id;

- (OFString*)ToString;
- (Shader*)Use;
- (void)Compile:(char*)vertexSource:(char*)fragmentSource;
- (Shader*)SetFloat:(OFString*)name Value:(GLfloat)value;
- (Shader*)SetInteger:(OFString*)name Value:(GLint)value;
- (Shader*)SetArray2:(OFString*)name X:(GLfloat)x Y:(GLfloat)y;
- (Shader*)SetArray2:(OFString*)name Value:(GLfloat*)value;
- (Shader*)SetArray3:(OFString*)name X:(GLfloat)x Y:(GLfloat)y Z:(GLfloat)z;
- (Shader*)SetArray3:(OFString*)name Value:(GLfloat*)value;
- (Shader*)SetArray4:(OFString*)name W:(GLfloat)w X:(GLfloat)x Y:(GLfloat)y Z:(GLfloat)z;
- (Shader*)SetArray4:(OFString*)name Value:(GLfloat*)value;
- (Shader*)SetMatrix:(OFString*)name Value:(GLfloat*)matrix;
- (void) checkCompileErrors:(GLuint)Id Type:(OFString*)type;


@end
