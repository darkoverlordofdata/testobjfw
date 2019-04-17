#include <GL/glew.h>
#include <tglm/tglm.h>
#import <ObjFW/ObjFW.h>
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

- (id)initWithShader:(Shader*)shader withSprite:(Texture2D*)sprite withCount:(int)count;
- (OFString*)ToString;
- (void)Update:(GLfloat)dt withObject:(GameObject*)obj withParticles:(GLuint)count withOffset:(Vec2)ofs;
- (void)Draw:(SpriteRenderer*)renderer;
- (GLuint)firstUnusedParticle;
- (void)respawnParticle:(struct Particle)particle withObject:(GameObject*) obj withOffset:(Vec2)ofs;

@property struct Particle * particles;
@property GLuint amount;
@property Shader* shader;
@property Texture2D* texture;
@property GLuint VAO;

@end
