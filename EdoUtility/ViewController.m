
#import "ViewController.h"

#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TestView *test = [[TestView alloc] init];
    NSLog(@"%@", test);
    
    [self.view addSubview:test];
}

@end
