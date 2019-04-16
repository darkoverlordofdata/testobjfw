#import <ObjFW/ObjFW.h>
#include "OFLog.h"

int main(int argc, char *argv[]) 
{
    @autoreleasepool {

        id name = @"Frodo";

        OFLog("Hello World");
        OFLog("That's a big %d", 420);
        OFLog(@"%@", name);

    }
    return 0;
}
