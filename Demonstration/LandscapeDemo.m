//
//  LandscapeDemo.m
//  Aposelene
//
//  Created by Jason Perry on 2/22/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface LandscapeDemo : NSObject <ASScene>
{
  ASFont* font;
}

@end


@implementation LandscapeDemo


- (void)update:(float)delta;
{
}


- (void)draw:(ASView*)view;
{
  [font drawText:@"I should be sideways." atPoint:CGPointMake(10, 310)];
}


- (void)setup:(ASView*)view;
{
  [[ASDirector instance] setLandscapeMode:YES];
  font = [[ASFont alloc] initWithFontFileNamed:@"PixelFont"];
  [font setColorFilterRed:0.9f green:0.0f blue:0.0f alpha:1.0f];
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  [ASDirector load:@"MainMenu"];
}


- (void)willLoadNextScene:(id)scene;
{
  [[ASDirector instance] setLandscapeMode:NO];
}

- (void)dealloc;
{
  [font release];
  [super dealloc];
}


@end

