//
//  SpriteDemo.m
//  Aposelene
//
//  Created by Jason Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//



#import "Aposelene.h"


@interface SpriteDemo : NSObject <ASScene>
{
  ASAtlas* atlas;
  NSMutableArray* sprites;
}

@end


@implementation SpriteDemo


- (void)update:(float)delta;
{
  for (ASSprite* sprite in sprites) {
    [sprite update:delta];
  }
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
  
  [[view font] drawText:[NSString stringWithFormat:@"Sprites: %d", [sprites count]]
                atPoint:CGPointMake(5, 25)];
  
  for (ASSprite* sprite in sprites) {
    [sprite draw];
  }
}


- (void)setup:(ASView*)view;
{
  NSString *path = [[NSBundle mainBundle] pathForResource:@"tim-hovering" ofType:@"plist"];
  NSDictionary* dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
  atlas = [[ASAtlas alloc] initWithDictionary:dictionary];
  sprites = [[NSMutableArray alloc] init];
  [dictionary release];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  CGPoint touchLocation = [[touches anyObject] locationInView:view];  
  
  if (CGRectContainsPoint(CGRectMake(20, 20, 20, 20), touchLocation))
  {
    [ASDirector load:@"MainMenu"];
    return;
  }
  
  ASSprite* sprite = [[ASSprite alloc] initWithAtlas:atlas animation:@"Hovering"];  
  CGPoint position = [view invertVerticalAxisInPoint:touchLocation];
  position.x -= 32;
  position.y -= 32;
  [sprite setPosition:position];
  [sprites addObject:sprite];
  [sprite release];
}


- (void)dealloc;
{
  [atlas release];
  [sprites release];
  [super dealloc];
}

@end
