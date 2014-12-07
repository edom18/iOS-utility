
@import UIKit;

#import "CALayer+EDODebugger.h"
#import <objc/runtime.h>


// 既存の`drawInContext:`を差し替える。
void EDOSwapLayerForDebug()
{
#ifndef DEBUG
    return;
#endif
    
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        Method drawInContext     = class_getInstanceMethod(CALayer.class, @selector(drawInContext:));
        Method swapDrawInContext = class_getInstanceMethod(CALayer.class, @selector(edo_swapDrawInContext:));
        
        // 取り出した実装を入れ替える
        method_exchangeImplementations(drawInContext, swapDrawInContext);
    });
}


// UIViewのレンダリングにボーダーを付与する。
@implementation CALayer (EDODebugger)

- (void)edo_swapDrawInContext:(CGContextRef)ctx
{
    self.borderColor = UIColor.redColor.CGColor;
    self.borderWidth = 1.0;
    [self edo_swapDrawInContext:ctx];
}

@end
