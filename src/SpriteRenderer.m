#import <SpriteRenderer.h>

@implementation SpriteRenderer

- (id)initWithShader:(Shader*)shader {
    self = [super init];
    if (self) {
        self.shader = shader;
    }
    return self;
    
}

- (OFString*)ToString {
    return @"SpriteRenderer";
}

- (SpriteRenderer*)Use {
    return self;
}

- (void)Draw:(Texture2D*)sprite Pos:(Vec2)pos Size:(Vec2)size Rot:(GLfloat)rot Color:(Vec3)color {

}

@end