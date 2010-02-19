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
  ASSprite* frozenSprite;
  NSMutableArray* sprites;
}

@end


@implementation SpriteDemo


- (void)update:(float)delta;
{
  [frozenSprite update:delta];
  for (ASSprite* sprite in sprites) {
    [sprite update:delta];
  }
}


- (void)draw:(ASView*)view;
{
  [frozenSprite draw];
  for (ASSprite* sprite in sprites) {
    [sprite draw];
  }
}


- (void)setup:(ASView*)view;
{
  NSString *path = [[NSBundle mainBundle] pathForResource:@"tim-hovering" ofType:@"plist"];
  NSDictionary* dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
  atlas = [[ASAtlas alloc] initWithDictionary:dictionary];
  frozenSprite = [[ASSprite alloc] initWithAtlas:atlas animation:@"Frozen"];
  [frozenSprite setPosition:CGPointMake(20, 396)];
  
  sprites = [[NSMutableArray alloc] init];
  
  [dictionary release];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  ASSprite* sprite = [[ASSprite alloc] initWithAtlas:atlas animation:@"Hovering"];  
  CGPoint position = [view invertVerticalAxisInPoint:[(UITouch*)[touches anyObject] locationInView:view]];
  position.x -= 32;
  position.y -= 32;
  [sprite setPosition:position];
  [sprites addObject:sprite];
  [sprite release];
}


- (void)dealloc;
{
  [atlas release];
  [frozenSprite release];
  [sprites release];
  [super dealloc];
}

@end
