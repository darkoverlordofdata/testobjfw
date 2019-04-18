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
         Pos:(Vec2)pos 
        Size:(Vec2)size 
         Rot:(GLfloat)rot 
       Color:(Vec3)color {

}

@end