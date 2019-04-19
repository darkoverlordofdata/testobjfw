#import <Shader.h>

const char* VERSION = "#version 300 es\n";
const char* HEADER = "#\n"
                    "#ifdef GL_ES\n"
                    "precision mediump float;\n"
                    "#endif\n";

@implementation Shader

- (OFString*)ToString {
    return @"Shader";
}

/**
 * Use shader
 */
- (Shader*)Use {
    glUseProgram(self.Id);
    return self;
}

/**
 * Compile
 * 
 * @param vertexSource vertex shader source code
 * @param fragmentSource fragment shader source code
 * 
 */
- (void)Compile:(char*)vertexSource:(char*)fragmentSource {
    GLuint sVertex, sFragment;
    // Vertex Shader
    char* vSource[] = { VERSION, HEADER, vertexSource };
    int vLength[] = { strlen(VERSION), strlen(HEADER), strlen(vertexSource) };
    sVertex = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(sVertex, 3, vSource, vLength);
    glCompileShader(sVertex);
    [self checkCompileErrors:sVertex Type:@"VERTEX"];
    // Fragment Shader
    char* fSource[] = { VERSION, HEADER, fragmentSource };
    int fLength[] = { strlen(VERSION), strlen(HEADER), strlen(fragmentSource) };
    sFragment = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(sFragment, 3, fSource, fLength);
    glCompileShader(sFragment);
    [self checkCompileErrors:sFragment Type:@"FRAGMENT"];
    // Shader Program
    self.Id = glCreateProgram();
    glAttachShader(self.Id, sVertex);
    glAttachShader(self.Id, sFragment);
    glLinkProgram(self.Id);
    [self checkCompileErrors:self.Id Type:@"PROGRAM"];
    // Delete the shaders as they're linked into our program now and no longer necessery
    glDeleteShader(sVertex);
    glDeleteShader(sFragment);

}

- (void) checkCompileErrors:(GLuint)Id Type:(OFString*)type {
    GLint success;
    GLchar infoLog[1024];
    if (type != @"PROGRAM")
    {
        glGetShaderiv(Id, GL_COMPILE_STATUS, &success);
        if (!success)
        {
            glGetShaderInfoLog(Id, 1024, nil, infoLog);
            OFLog(@"| ERROR::SHADER: Compile-time error: Type: %s", type);
            OFLog(@"%s", infoLog);
            OFLog(@"-- --------------------------------------------------- -- ");
        }
    }
    else
    {
        glGetProgramiv(Id, GL_LINK_STATUS, &success);
        if (!success)
        {
            glGetProgramInfoLog(Id, 1024, nil, infoLog);
            OFLog(@"| ERROR::SHADER: Link-time error: Type: %s", type);
            OFLog(@"%s", infoLog);
            OFLog(@"-- --------------------------------------------------- -- ");
        }
    }

}

- (Shader*)SetFloat:(OFString*)name Value:(GLfloat)value {
    glUniform1f(glGetUniformLocation(self.Id, name), value);
    return self;
}

- (Shader*)SetInteger:(OFString*)name Value:(GLint)value {
    glUniform1i(glGetUniformLocation(self.Id, name), value);
    return self;
}

- (Shader*)SetArray2:(OFString*)name X:(GLfloat)x Y:(GLfloat)y {
    glUniform2f(glGetUniformLocation(self.Id, name), x, y);
    return self;
}

- (Shader*)SetArray2:(OFString*)name Value:(GLfloat*)value {
    glUniform2f(glGetUniformLocation(self.Id, name), value[0], value[1]);
    return self;
}

- (Shader*)SetArray3:(OFString*)name X:(GLfloat)x Y:(GLfloat)y Z:(GLfloat)z {
    glUniform3f(glGetUniformLocation(self.Id, name), x, y, z);
    return self;
}

- (Shader*)SetArray3:(OFString*)name Value:(GLfloat*)value {
    glUniform3f(glGetUniformLocation(self.Id, name), value[0], value[1], value[2]);
    return self;
}

- (Shader*)SetArray4:(OFString*)name W:(GLfloat)w X:(GLfloat)x Y:(GLfloat)y Z:(GLfloat)z {
    glUniform4f(glGetUniformLocation(self.Id, name), x, y, z, w);
    return self;
}

- (Shader*)SetArray4:(OFString*)name Value:(GLfloat*)value {
    glUniform4f(glGetUniformLocation(self.Id, name), value[0], value[1], value[2], value[3]);
    return self;
}

- (Shader*)SetMatrix:(OFString*)name Value:(GLfloat*)matrix {
    glUniformMatrix4fv(glGetUniformLocation(self.Id, name), 1, GL_FALSE, matrix);
    return self;
}

@end