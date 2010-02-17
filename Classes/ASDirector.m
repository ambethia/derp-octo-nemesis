//
//  ASDirector.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "ASDirector.h"


@implementation ASDirector

@synthesize scene;

+ (ASDirector*)instance;
{
  static ASDirector* instance;
  
  @synchronized(self)
  {
    if (!instance)
    {
      instance = [[ASDirector alloc] init];
    }
  }
  return instance;
}



+ (ASView*)view;
{
  static ASView* view;
  if (!view)
  {
    view = [[ASView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  }
  return view;
}


+ (void)load:(NSString*)sceneClassName;
{
  Class klass = NSClassFromString(sceneClassName);
  if (klass)
  {
    id _scene = [[klass alloc] init];
    [[self instance] setScene:_scene];
    [_scene release];
  }
  else {
    NSLog(@"Couldn't load scene: \"%@\"", sceneClassName);
  }
  [[self view] setNeedsLayout];
}



- (void)dealloc;
{
  [scene release];
  [super dealloc];
}

@end
