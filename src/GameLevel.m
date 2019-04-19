#import <GameLevel.h>

@implementation GameLevel

/**
 * GameLevel
 */
- (instancetype)initWithFile:(OFString*)path 
                       Width:(int)width 
                       Height:(int)height {
    self = [super init];
    return [self LoadFrom:path Width:width Height:height];
}

- (OFString*)ToString {
    return  @"GameLevel";

}

/**
 * LoadFrom
 * 
 * @oaram file  text file with level data
 * @param levelWidth of level in tiles
 * @param levelHeight of level in tiles
 * 
 */
- (instancetype)LoadFrom:(OFString*)path 
                   Width:(int)width 
                  Height:(int)height {
    return self;
}

/**
 * Draw
 * 
 * @param renderer to use
 * 
 */
- (void)Draw:(SpriteRenderer*)renderer {

}

/**
 * IsCompleted
 * 
 * @returns true when complete
 * 
 */
- (bool)IsCompleted {
    return false;
}

@end