//
//  AppDelegate.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "AppDelegate.h"
#import "ASView.h"
#import "ASDirector.h"


@implementation AppDelegate


- (void)applicationDidFinishLaunching:(UIApplication *)application;
{
  window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

  [ASDirector load:@"MainMenu"];
  [window addSubview:[ASDirector view]];

	[window setUserInteractionEnabled:YES];
  [window makeKeyAndVisible];

  [[ASDirector view] performSelectorOnMainThread:@selector(mainLoop) withObject:nil waitUntilDone:NO];
}


- (void)dealloc;
{
  [window release];
  [super dealloc];
}


@end
