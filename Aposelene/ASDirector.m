//
//  ASDirector.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "ASDirector.h"
#import "ASView.h"


@interface ASDirector()

@property (nonatomic, retain, readwrite) id <ASScene> scene;

@property (nonatomic, retain) ASView* view;

@end


@implementation ASDirector

@synthesize scene;
@synthesize view;
@synthesize landscapeMode;

+ (ASDirector*)instance;
{
  static ASDirector* _instance;
  @synchronized(self)
  {
    if (!_instance)
    {
      _instance = [[ASDirector alloc] init];
    }
  }
  return _instance;
}



+ (ASView*)view;
{
  static ASView* _view;
  if (!_view)
  {
    _view = [[ASView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
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
    if ([[[self instance] scene] respondsToSelector:@selector(willLoadNextScene:)]) {
      [[[self instance] scene] willLoadNextScene:_scene];
    }
    [[self instance] setScene:_scene];
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
