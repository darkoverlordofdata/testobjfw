#import <Game.h>

@implementation Game

// Game-related State data
static SpriteRenderer* _renderer = nil;
static GameObject* _player = nil;
static BallObject* _ball = nil;

/**
 * Create Game instance
 * 
 * @param Width of screen
 * @param Height of screen
 * 
 */
- (instancetype)initWithWidth:(int)width 
                       Height:(int)height {
    if ((self = [super init])) {
        self.Width = width;
        self.Height = height;
        self.State = GAME_ACTIVE;
        self.Level = 0;
        self.Levels = [[OFArray alloc]init];
        self.Keys = malloc(1024);
    }
    return self;
}

-(Collision)CollisionTuple:(bool)isTrue:(Direction)dir:(Vec2)vec
{
    Collision tuple = { isTrue, dir, vec };
    return tuple;
}

- (OFString*)ToString {
    return @"Game";
}

/**
 * Start the game
 */
- (void)Start {
    // Load shaders
    [ResourceManager LoadShader:@"sprite" Vertex:@"shaders/sprite.vs" Frag:@"shaders/sprite.frag"];
    // Configure shaders
    Mat projection = glm_ortho(0, (GLfloat)self.Width, (GLfloat)self.Height, 0, -1, 1);
    Shader* shader = [ResourceManager GetShader:@"sprite"];
    [shader Use];
    [shader SetInteger:@"sprite" Value:0];
    [shader SetMatrix:@"projection" Value:&projection];

     // Load textures
    [ResourceManager LoadTexture:@"block"       Path:@"textures/block.png" Alpha:false];
    [ResourceManager LoadTexture:@"background"  Path:@"textures/background.jpg" Alpha:false];
    [ResourceManager LoadTexture:@"block_solid" Path:@"textures/block_solid.png" Alpha:false];
    [ResourceManager LoadTexture:@"face"        Path:@"textures/awesomeface.png" Alpha:true];
    [ResourceManager LoadTexture:@"paddle"      Path:@"textures/paddle.png" Alpha:true];

    // Set render-specific controls
    _Renderer = [[SpriteRenderer alloc]initWithShader: [ResourceManager GetShader:@"sprite"]];

    // Load levels
    self.Levels = @[
        [[GameLevel alloc]initWithFile:@"levels/one.lvl" Width:self.Width Height:self.Height*0.5],
        [[GameLevel alloc]initWithFile:@"levels/two.lvl" Width:self.Width Height:self.Height*0.5],
        [[GameLevel alloc]initWithFile:@"levels/three.lvl" Width:self.Width Height:self.Height*0.5],
        [[GameLevel alloc]initWithFile:@"levels/four.lvl" Width:self.Width Height:self.Height*0.5]
    ];

    // Configure game objects
    Vec2 playerPos = (Vec2){ self.Width / 2 - PLAYER_SIZE.x / 2, self.Height - PLAYER_SIZE.y };
    _Player = [[GameObject alloc]initWithName:@"player" 
                                Position: playerPos
                                Size: PLAYER_SIZE
                                Sprite: [ResourceManager GetTexture:@"paddle"]
                                Color: WHITE];

    Vec2 ballPos = playerPos + (Vec2){ PLAYER_SIZE.x / 2 - BALL_RADIUS, -BALL_RADIUS * 2 };
    _Ball = [[BallObject alloc]initWithPos: ballPos
                                Radius: BALL_RADIUS
                                Velocity: INITIAL_BALL_VELOCITY
                                Sprite: [ResourceManager GetTexture:@"face"]];

}

/**
 * Update
 * 
 * @param dt delta time
 */
- (void)Update:(GLfloat) dt {

    // Update objects
    [self.Ball Move:dt:self.Width];
    // Check for collisions
    [self DoCollisions];

    // Check loss condition
    if (self.Ball.Position.x >= self.Height) {
        [self ResetLevel];
        [self ResetPlayer];
    }
}

/**
 * ProcessInput
 * 
 * @param dt delta time
 */
- (void)ProcessInput:(GLfloat) dt {
    if (self.State == GAME_ACTIVE) {
        GLfloat velocity = PLAYER_VELOCITY * dt;
        // Move playerboard
        if (self.Keys[GLFW_KEY_A] || self.Keys[GLFW_KEY_LEFT])
        {
            if (self.Player.Position.x >= 0)
            {
                self.Player.Position = (Vec2){ _Player.Position.x - velocity, _Player.Position.y };
                if (self.Ball.Stuck)
                    self.Ball.Position = (Vec2){ _Player.Position.x - velocity, _Player.Position.y };
            }
        }
        if (self.Keys[GLFW_KEY_D] || self.Keys[GLFW_KEY_RIGHT])
        {
            if (self.Player.Position.x <= self.Width - self.Player.Size.x)
            {
                self.Player.Position = (Vec2){ _Player.Position.x + velocity, _Player.Position.y };
                if (self.Ball.Stuck)
                    self.Ball.Position = (Vec2){ _Player.Position.x + velocity, _Player.Position.y };
            }
        }
        if (self.Keys[GLFW_KEY_SPACE])
            self.Ball.Stuck = false;

    }
}

/**
 * Render
 * 
 */
- (void)Render {
    if (self.State == GAME_ACTIVE)
    {
        // Draw background
        Vec2 size = { self.Width, self.Height };
        [self.Renderer Draw:[ResourceManager GetTexture:@"background"] Pos:ZERO Size:size  Rot:0.0f  Color:WHITE];
        GameLevel* level = self.Levels[self.Level];
        [level Draw:self.Renderer];
        [self.Player Draw:self.Renderer];
        [self.Ball Draw:self.Renderer];
    }

}

/**
 * ResetLevel
 * 
 */
- (void)ResetLevel {
    if (self.Level == 0) {
        GameLevel* level = self.Levels[0];
        [level LoadFrom:@"levels/one.lvl" Width:self.Width Height:self.Height * 0.5f];
    }
    else if (self.Level == 1)
    {
        GameLevel* level = self.Levels[1];
        [level LoadFrom:@"levels/two.lvl" Width:self.Width Height:self.Height * 0.5f];
    }
    else if (self.Level == 2)
    {
        GameLevel* level = self.Levels[2];
        [level LoadFrom:@"levels/three.lvl" Width:self.Width Height:self.Height * 0.5f];
    }
    else if (self.Level == 3)
    {
        GameLevel* level = self.Levels[3];
        [level LoadFrom:@"levels/four.lvl" Width:self.Width Height:self.Height * 0.5f];
    }

}

/**
 * ResetPlayer
 * 
 */
- (void)ResetPlayer {
    self.Player.Size = PLAYER_SIZE;
    self.Player.Position = (Vec2){ self.Width / 2 - PLAYER_SIZE.x / 2, self.Height - PLAYER_SIZE.y };
    [self.Ball Reset:self.Player.Position + (Vec2){ PLAYER_SIZE.x / 2 - BALL_RADIUS, -(BALL_RADIUS * 2) }, INITIAL_BALL_VELOCITY];
}

/**
 * Release game resources
 */
- (void)Dispose {
    free(self.Keys);
}

/**
 * DoCollisions
 * 
 */
- (void)DoCollisions {

}

- (void)SetKey:(int)key 
         Value:(bool) value {
    self.Keys[key] = value;
}

- (void)SetState:(GameState) state {
    self.State = state;
}


@end
