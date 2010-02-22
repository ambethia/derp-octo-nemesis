//
//  AnimationDemo.m
//  Aposelene
//
//  Created by Jason L Perry on 2/21/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


typedef enum {
  kChanIdleState,
  kChanAttackAState,
  kChanAttackBState,
} kChanState;


@interface AnimationDemo : NSObject <ASScene>
  ASAtlas* atlas;
  ASSprite* sprite;
  kChanState state;
@end


@implementation AnimationDemo


- (void)update:(float)delta;
{
  switch (state) {
    case kChanIdleState:
      break;
    case kChanAttackAState:
      if ([sprite keyframe] >= 11) {
        state = kChanIdleState;
        [sprite setAnimationKey:@"Idle"];
      }
      break;
    case kChanAttackBState:
      if ([sprite keyframe] >= 16) {
        state = kChanIdleState;
        [sprite setAnimationKey:@"Idle"];
      }      
      break;
  }
  [sprite update:delta];
}


- (void)draw:(ASView*)view;
{
  static const GLfloat vertices[] = {
    20.0f, 440.0f, // BL
    20.0f, 460.0f, // TL
    40.0f, 440.0f, // BR
    40.0f, 460.0f  // TR
  };
  
  glEnableClientState(GL_VERTEX_ARRAY);
  glLoadIdentity();
  glVertexPointer(2, GL_FLOAT, 0, vertices);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
  glDisableClientState(GL_VERTEX_ARRAY);
  
  [sprite draw];
}


- (void)setup:(ASView*)view;
{
  glClearColor(0.69f, 0.2f, 0.2f, 0.0f);
  NSString *path = [[NSBundle mainBundle] pathForResource:@"BikiniBibleChan" ofType:@"plist"];
  NSDictionary* dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
  atlas = [[ASAtlas alloc] initWithDictionary:dictionary];
  sprite = [[ASSprite alloc] initWithAtlas:atlas animationKey:@"Idle"];
  state = kChanIdleState;
  [sprite setPosition:CGPointMake(138, 0)];
  [dictionary release];
}


- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  switch (state) {
    case kChanIdleState:
      if (random() % 2)
      {
        state = kChanAttackAState;
        [sprite setAnimationKey:@"Attack A"];
      }
      else
      {
        state = kChanAttackBState;
        [sprite setAnimationKey:@"Attack B"];
      }
      break;
    case kChanAttackAState:
      break;
    case kChanAttackBState:
      break;
  }
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  CGPoint touchLocation = [[touches anyObject] locationInView:view];
  
  if (CGRectContainsPoint(CGRectMake(20, 20, 20, 20), touchLocation))
  {
    [ASDirector load:@"MainMenu"];
  }
}


- (void)dealloc;
{
  [sprite release];
  [atlas release];
  [super dealloc];
}


@end
