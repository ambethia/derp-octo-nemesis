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
@synthesize view;

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


+ (void)load:(NSString*)sceneClassName;
{
  Class klass = NSClassFromString(sceneClassName);
  if (klass)
  {
    id _scene = [[klass alloc] init];
    [[self instance] setScene:_scene];
    [[[self instance] view] setNeedsLayout];
    [_scene release];
  }
  else {
    NSLog(@"Couldn't load scene: \"%@\"", sceneClassName);
  }

}

- (void)dealloc;
{
  [scene release];
  [view release];
  [super dealloc];
}

@end
