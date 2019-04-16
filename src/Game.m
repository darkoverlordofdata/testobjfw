#import <Game.h>

@implementation Game
- (id)initWithHeight:(int)height andWidth:(int)width {
    self = [super init];
    if (self) {
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
- (void)SetKey:(int) key value:(bool) value {

}
- (void)SetState:(GameState) state {
    self.State = state;
}


@end
