
#import "ViewController.h"

#import "TestView.h"
#import "UTLMacro.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TestView *test = [[TestView alloc] init];
    UTLLog(@"%@", test);
    
    EDOSwapLayerForDebug();
    
    [self.view addSubview:test];
}

@end
