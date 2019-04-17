#import <Game.h>

@implementation Game
- (id)initWithHeight:(int)height andWidth:(int)width {
    if ((self = [super init])) {
        self.Width = width;
        self.Height = height;
    }
    return self;
}

- (OFString*)ToString {
    return @"Game";

}
- (void)Start {

}
- (void)Update:(GLfloat) dt {

}
- (void)ProcessInput:(GLfloat) dt {

}
- (void)Render {

}
- (void)ResetLevel {

}
- (void)ResetPlayer {

}
- (void)Dispose {

}
- (void)DoCollisions {

}
- (void)SetKey:(int) key to:(bool) value {

}
- (void)SetState:(GameState) state {
    self.State = state;
}


@end
