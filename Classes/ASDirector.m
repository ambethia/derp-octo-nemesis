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



+ (ASView*)view;
{
  static ASView* _view;
  if (!_view)
  {
    _view = [[ASView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[self instance] setView:_view];
    [_view release];
  }
  return _view;
}


+ (void)load:(NSString*)sceneClassName;
{
  Class klass = NSClassFromString(sceneClassName);
  if (klass)
  {
    id _scene = [[klass alloc] init];
    [[self instance] setScene:_scene];
    [[self instance] setupOpenGL];
    [_scene release];
  }
  else {
    NSLog(@"Couldn't load scene: \"%@\"", sceneClassName);
  }
  [[self view] setNeedsLayout];
}

- (void)setupOpenGL;
{
  glLoadIdentity();
  glViewport(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
  glMatrixMode(GL_PROJECTION);

  glLoadIdentity();
  glOrthof(0, self.view.bounds.size.width, 0, self.view.bounds.size.height, -1, 1);
  glMatrixMode(GL_MODELVIEW);

  glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
  glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_BLEND_SRC);
}


- (void)dealloc;
{
  [scene release];
  [super dealloc];
}

@end
