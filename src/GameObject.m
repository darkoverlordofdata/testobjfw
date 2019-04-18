#import <GameObject.h>

@implementation GameObject

/**
 * Constructor
 * 
 * @param Position initial placement
 * @param Size sprite size
 * @param Sprite to display
 * @param Color tiniting color
 */
- (instancetype)initWithName:(OFString*)name 
                    Position:(Vec2)pos 
                        Size:(Vec2)size 
                      Sprite:(Texture2D*)sprite 
                       Color:(Vec3)color {
    if ((self = [super init])) {
        self.Position = pos;
        self.Size = size;
        self.Sprite = sprite;
        self.Color = color;
        self.Name = name;
    }
    return self;
}

- (OFString*)ToString {
    return @"GameObject";
}

/**
 * Draw
 * 
 * @param renderer to draw sprite with
 */
- (void)Draw:(SpriteRenderer*)renderer {

}

@end