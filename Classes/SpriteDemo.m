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
}

@end


@implementation SpriteDemo


- (void)update:(float)delta;
{
}


- (void)draw:(ASView*)view;
{
  [atlas drawFrame:0 AtPoint:CGPointMake(128, 176)];
}


- (void)setup:(ASView*)view;
{
  NSString *path = [[NSBundle mainBundle] pathForResource:@"tim-hovering" ofType:@"plist"];
  NSDictionary* dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
  atlas = [[ASAtlas alloc] initWithDictionary:dictionary];
  [dictionary release];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  [ASDirector load:@"MainMenu"];
}


@end
