
#import "TestView.h"

#import "UTLUtilities.h"

@implementation TestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"hoge";
        self.age  = @(16);
        self.test = [[UIView alloc] init];
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"%@\n", [super description]];
    NSString *log = UTLLogDescription(self);
    [description appendString:log];
    
    return description;
}

@end
