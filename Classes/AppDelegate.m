//
//  AppDelegate.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "AppDelegate.h"
#import "Aposelene.h"


@implementation AppDelegate


- (void)applicationDidFinishLaunching:(UIApplication *)application;
{
  window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	[window setUserInteractionEnabled:YES];
  [window makeKeyAndVisible];
  [window addSubview:[ASDirector view]];
  [ASDirector load:@"MainMenu"];
  [[ASDirector view] performSelectorOnMainThread:@selector(mainLoop) withObject:nil waitUntilDone:NO];
}


- (void)dealloc;
{
  [window release];
  [super dealloc];
}


@end
