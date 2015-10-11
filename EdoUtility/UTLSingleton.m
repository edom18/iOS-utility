
#import "UTLSingleton.h"

/**
 *  Containes each singleton instancies creating from other sub classies.
 */
static NSMutableDictionary *UTLSingletonInstancies = nil;

@implementation UTLSingleton

/**
 *  Called when this (or sub) class is used first time.
 */
+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UTLSingletonInstancies = [[NSMutableDictionary alloc] init];
    });
}


//////////////////////////////////////////////////
#pragma mark - singleton process

/**
 *  Return a singleton instance.
 *
 *  @return singleton instance.
 */
+ (instancetype)sharedInstance
{
    @synchronized (self) {
        id storedSingleton = UTLSingletonInstancies[NSStringFromClass(self)];
        if (storedSingleton) {
            return storedSingleton;
        }
        
        storedSingleton = [[super allocWithZone:nil] init];
        NSString *key = NSStringFromClass(self);
        UTLSingletonInstancies[key] = storedSingleton;
        
        return storedSingleton;
    }
}


/**
 *  Delegete alloc method to `sharedInstance` methos.
 *
 *  @return new singleton insntance.
 */
+ (id)allocWithZone:(struct _NSZone *)zone
{
    return self.class.sharedInstance;
}

@end
