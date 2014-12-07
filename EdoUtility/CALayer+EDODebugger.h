//
// デバッグ用コード。
//   UIViewのCALayerにボーダーを付けて、レイアウトを分かりやすくするためのものです。
//

#import <QuartzCore/QuartzCore.h>

void KLMSwapLayerForDebug();

@interface CALayer (EDODebugger)

#ifdef DEBUG
- (void)edo_swapDrawInContext:(CGContextRef)ctx;
#endif

@end
