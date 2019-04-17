#import <ParticleGenerator.h>

@implementation ParticleGenerator

- (id)initWithShader:(Shader*)shader withSprite:(Texture2D*)sprite withCount:(int)count {
    self = [super init];
    if (self) {
        self.shader = shader;
        self.texture = sprite;
        self.amount = count;
    }
    return self;
}

- (OFString*)ToString {
    return @"ParticleGenerator";
}

- (void)Update:(GLfloat)dt withObject:(GameObject*)obj withParticles:(GLuint)count withOffset:(Vec2)ofs {

}

- (void)Draw:(SpriteRenderer*)renderer {

}

- (GLuint)firstUnusedParticle {
    return 0;
}

- (void)respawnParticle:(struct Particle)particle withObject:(GameObject*) obj withOffset:(Vec2)ofs {

}

@end