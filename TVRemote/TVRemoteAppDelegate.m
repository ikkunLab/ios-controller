#import "TVRemoteAppDelegate.h"
#import "TVRemoteViewController.h"

@implementation TVRemoteAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[TVRemoteViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
