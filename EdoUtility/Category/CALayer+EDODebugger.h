
#import <QuartzCore/QuartzCore.h>

/**
 *  デバッグ用
 *  既存の`drawInContext:`を差し替える。
 *  UIViewのレンダリングにボーダーを付与する。
 */
void EDOSwapLayerForDebug();


/**
 *  CALayerのデバッグ用カテゴリ
 */
@interface CALayer (EDODebugger)

#ifdef DEBUG
- (void)edo_swapDrawInContext:(CGContextRef)ctx;
#endif

@end
