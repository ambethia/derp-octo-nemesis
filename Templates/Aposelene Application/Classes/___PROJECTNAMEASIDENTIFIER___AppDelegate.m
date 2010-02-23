//
//  ___PROJECTNAMEASIDENTIFIER___AppDelegate.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "___PROJECTNAMEASIDENTIFIER___AppDelegate.h"
#import "Aposelene.h"
#import "___PROJECTNAMEASIDENTIFIER___Scene.h"

@implementation ___PROJECTNAMEASIDENTIFIER___AppDelegate


- (void)applicationDidFinishLaunching:(UIApplication *)application {
  window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	[window setUserInteractionEnabled:YES];
  [window makeKeyAndVisible];
  [window addSubview:[ASDirector view]];
  [ASDirector load:@"___PROJECTNAMEASIDENTIFIER___Scene"];
  [[ASDirector view] performSelectorOnMainThread:@selector(mainLoop) withObject:nil waitUntilDone:NO];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
