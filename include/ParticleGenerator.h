#import <GL/glew.h>
#import <tglm/tglm.h>
#import <Foundation/Foundation.h>
#import "Shader.h"
#import "Texture2D.h"
#import "GameObject.h"

// Represents a single particle and its state
struct Particle
{
    Vec2 Position;
    Vec2 Velocity;
    Vec4 Color;
    GLfloat Life;

    // Particle() : Position(0.0f), Velocity(0.0f), Color(1.0f), Life(0.0f) { }
} Particle;

@interface ParticleGenerator : OFObject
@property struct Particle * Particles;
@property GLuint Amount;
@property Shader* Shader;
@property Texture2D* Texture;
@property GLuint VAO;

- (instancetype)initWithShader:(Shader*)shader 
                        Sprite:(Texture2D*)sprite 
                         Count:(int)count;
- (OFString*)ToString;
- (void)Update:(GLfloat)dt Object:(GameObject*)obj Particles:(GLuint)count Offset:(Vec2)ofs;
- (void)Draw:(SpriteRenderer*)renderer;
- (GLuint)firstUnusedParticle;
- (void)respawnParticle:(struct Particle)particle:(GameObject*)object:(Vec2)offset;


@end
