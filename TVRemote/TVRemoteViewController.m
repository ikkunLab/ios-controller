#import "TVRemoteViewController.h"

static NSString * const kTVServerURL = @"http://192.168.1.100:3000";

@implementation TVRemoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, 568, 36)];
    title.text = @"TV-HOME";
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont boldSystemFontOfSize:26.0];
    [self.view addSubview:title];

    [self addButtonWithTitle:@"▲" frame:CGRectMake(234, 70, 100, 70) path:@"/remote/up"];
    [self addButtonWithTitle:@"◀" frame:CGRectMake(125, 145, 100, 70) path:@"/remote/left"];
    [self addButtonWithTitle:@"OK" frame:CGRectMake(234, 145, 100, 70) path:@"/remote/ok"];
    [self addButtonWithTitle:@"▶" frame:CGRectMake(343, 145, 100, 70) path:@"/remote/right"];
    [self addButtonWithTitle:@"▼" frame:CGRectMake(234, 220, 100, 70) path:@"/remote/down"];

    [self addButtonWithTitle:@"HOME" frame:CGRectMake(125, 315, 100, 58) path:@"/remote/home"];
    [self addButtonWithTitle:@"BACK" frame:CGRectMake(343, 315, 100, 58) path:@"/remote/back"];
    [self addButtonWithTitle:@"VOL −" frame:CGRectMake(125, 390, 100, 58) path:@"/remote/volume-down"];
    [self addButtonWithTitle:@"VOL +" frame:CGRectMake(343, 390, 100, 58) path:@"/remote/volume-up"];
}

- (void)addButtonWithTitle:(NSString *)title frame:(CGRect)frame path:(NSString *)path {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.tag = (NSInteger)[self pathCode:path];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    button.backgroundColor = [UIColor darkGrayColor];
    button.layer.cornerRadius = 12.0;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (NSInteger)pathCode:(NSString *)path {
    NSArray *paths = @[@"/remote/up", @"/remote/down", @"/remote/left", @"/remote/right", @"/remote/ok", @"/remote/back", @"/remote/home", @"/remote/volume-down", @"/remote/volume-up"];
    return [paths indexOfObject:path];
}

- (void)buttonPressed:(UIButton *)sender {
    NSArray *paths = @[@"/remote/up", @"/remote/down", @"/remote/left", @"/remote/right", @"/remote/ok", @"/remote/back", @"/remote/home", @"/remote/volume-down", @"/remote/volume-up"];
    NSInteger index = sender.tag;
    if (index < 0 || index >= (NSInteger)paths.count) return;

    NSString *urlString = [kTVServerURL stringByAppendingString:paths[index]];
    NSURL *url = [NSURL URLWithString:urlString];
    if (!url) return;

    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url];
    [task resume];
}

@end
