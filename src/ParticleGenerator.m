#import <ParticleGenerator.h>

@implementation ParticleGenerator

/**
 * ParticleGenerator
 * 
 * @param shader to use
 * @param texture to source from
 * @param amount number of particles to generate
 * 
 */
- (instancetype)initWithShader:(Shader*)shader 
                        Sprite:(Texture2D*)sprite 
                         Count:(int)count {
    if ((self = [super init])) {
        self.Shader = shader;
        self.Texture = sprite;
        self.Amount = count;
    }
    return self;
}

- (OFString*)ToString {
    return @"ParticleGenerator";
}

/**
 * Update
 * 
 * @param dt delta time
 * @param object GameObject
 * @param newParticles count
 * @param offset to display from
 * 
 */
- (void)Update:(GLfloat)dt Object:(GameObject*)obj Particles:(GLuint)count Offset:(Vec2)ofs {

}

/**
 * Render all particles
 * 
 */
- (void)Draw:(SpriteRenderer*)renderer {

}

// Stores the index of the last particle used (for quick access to next dead particle)
- (GLuint)firstUnusedParticle {
    return 0;
}

- (void)respawnParticle:(struct Particle)particle:(GameObject*)object:(Vec2)offset {

}

@end