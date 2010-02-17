//
//  AppDelegate.m
//

#import "ApplicationDelegate.h"


@implementation ApplicationDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application
{    
  [window makeKeyAndVisible];
}


- (void)dealloc
{
  [window release];
  [super dealloc];
}


@end
