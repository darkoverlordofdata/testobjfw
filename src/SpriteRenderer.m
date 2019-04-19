#import <SpriteRenderer.h>

@implementation SpriteRenderer

/**
 * SpriteRenderer
 * 
 * @param shader to use for rendering
 * 
 */
- (instancetype)initWithShader:(Shader*)shader {
    if ((self = [super init])) {
        self.Shader = shader;
    }
    GLuint VBO;
    GLfloat vertices[] = { 
        // Pos      // Tex
        0.0f, 1.0f, 0.0f, 1.0f,
        1.0f, 0.0f, 1.0f, 0.0f,
        0.0f, 0.0f, 0.0f, 0.0f, 

        0.0f, 1.0f, 0.0f, 1.0f,
        1.0f, 1.0f, 1.0f, 1.0f,
        1.0f, 0.0f, 1.0f, 0.0f
    };

    glGenVertexArrays(1, &_VAO);
    glGenBuffers(1, &VBO);

    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

    glBindVertexArray(self.VAO);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 4 * sizeof(GLfloat), (GLvoid*)0);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindVertexArray(0);

    return self;
    
}

- (OFString*)ToString {
    return @"SpriteRenderer";
}

- (void)Dispose {
}

/**
 * Draw
 * 
 * @param texture the image to render
 * @param position to render at
 * @param size to render
 * @param rotate amount to rotate by
 * @param color to tint
 * 
 */
- (void)Draw:(Texture2D*)sprite 
         Pos:(Vec2)position 
        Size:(Vec2)size 
         Rot:(GLfloat)rot 
       Color:(Vec3)color {

    Mat model = mat_identity();
    model = glm_translate(model, (Vec3){ position.x, position.y, 0.0f });  // First translate (transformations are: scale happens first, then rotation and then finall translation happens; reversed order)
    model = glm_translate(model, (Vec3){ 0.5f * size.x, 0.5f * size.y, 0.0f }); // Move origin of rotation to center of quad
    model = glm_rotate(model, rot, (Vec3){ 0.0f, 0.0f, 1.0f }); // Then rotate
    model = glm_translate(model, (Vec3){ -0.5f * size.x, -0.5f * size.y, 0.0f }); // Move origin back
    model = glm_scale(model, (Vec3){ size.x, size.y, 1.0f }); // Last scale

    [self.Shader Use];
    [self.Shader SetMatrix:@"model" Value:&model];
    [self.Shader SetArray3:@"spriteColor" Value:&color];
    
    glActiveTexture(GL_TEXTURE0);
    [sprite Bind];

    glBindVertexArray(self.VAO);
    glDrawArrays(GL_TRIANGLES, 0, 6);
    glBindVertexArray(0);

}

@end