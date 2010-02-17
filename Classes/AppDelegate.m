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
	asView = [[ASView alloc] initWithFrame:[UIScreen mainScreen].bounds];

	[window setUserInteractionEnabled:YES];	
	[window addSubview:asView];
	[window makeKeyAndVisible];
  
  [[ASDirector instance] setView:asView];
  [ASDirector load:@"MainMenu"];
  [asView performSelectorOnMainThread:@selector(mainLoop) withObject:nil waitUntilDone:NO]; 
}


- (void)dealloc;
{
  [window release];
  [asView release];
  [super dealloc];
}


@end
