#import <GameLevel.h>

@implementation GameLevel

- (id)initWithFile:(GLchar*)path withWidth:(int)width withHeight:(int)height {
    self = [super init];
    return [self Load];
}
- (OFString*)ToString {
    return  @"GameLevel";

}
- (id)Load:(GLchar*)path withWidth:(int)width withHeight:(int)height {
    return self;
}
- (void)Draw:(SpriteRenderer*)renderer {

}
- (bool)IsCompleted {
    return false;
}

@end