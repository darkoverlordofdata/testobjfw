#import <GameObject.h>

@implementation GameObject

- (id)initWithName:(OFString*)name withPos:(Vec2)pos withSize:(Vec2)size withSprite:(Texture2D*)sprite withColor:(Vec3)color {
    self = [super init];
    if (self) {
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
- (void)Draw:(SpriteRenderer*)renderer {

}

@end