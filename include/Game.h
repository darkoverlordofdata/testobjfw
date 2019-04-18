#import <GL/glew.h>
#import <GLFW/glfw3.h>
#import <tglm/tglm.h>
#import <Foundation/Foundation.h>

// Represents the current state of the game
typedef enum  {
    GAME_ACTIVE,
    GAME_MENU,
    GAME_WIN
} GameState;

// Represents the four possible (collision) directions
typedef enum  {
    UP,
    RIGHT,
    DOWN,
    LEFT
} Direction;

typedef struct Collision {
    bool first;
    Direction second; 
    Vec2 third;
} Collision;

// Initial size of the player paddle
static const Vec2 PLAYER_SIZE = { 100, 20 };
// Initial velocity of the player paddle
static const GLfloat PLAYER_VELOCITY = 500.0f;
// Initial velocity of the Ball
static const Vec2 INITIAL_BALL_VELOCITY = { 100.0f, -350.0f };
// Radius of the ball object@property 
static const GLfloat BALL_RADIUS = 12.5f;

@interface Game : OFObject 
// - (instancetype)init:(int)height by:(int)width;
- (instancetype)initWithWidth:(int)width 
                       Height:(int)height;
- (OFString*)ToString;
- (void)Start;
- (void)Update:(GLfloat) dt;
- (void)ProcessInput:(GLfloat) dt;
- (void)Render;
- (void)ResetLevel;
- (void)ResetPlayer;
- (void)Dispose;
- (void)DoCollisions;
- (void)SetKey:(int)key 
         Value:(bool) value;
- (void)SetState:(GameState) state;
-(Collision)CollisionTuple:(bool)isTrue:(Direction)dir:(Vec2)vec;

@property GameState State;	
@property bool* Keys;
@property GLuint Width;
@property GLuint Height;
@property OFArray* Levels; 
@property GLuint Level;    
@property OFString *name;
@end
