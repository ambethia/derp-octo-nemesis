//
//  OpeningScebe.m
//  ___PROJECTNAME___
//
//  Created by Jason Perry on 2/23/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "OpeningScebe.h"


@implementation OpeningScebe


- (void)update:(float)delta;
{
  
}


- (void)draw:(ASView*)view;
{
  [font drawText:@"Welcome to Aposelene." atPoint:CGPointMake(10, 470)];
}


- (void)setup:(ASView*)view;
{
  font = [[ASFont alloc] initWithFontFileNamed:@"ASPixel"];
  [font setColorFilterRed:0.9f green:0.0f blue:0.0f alpha:1.0f];
}

/*
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  
}
*/


/*
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  
}
*/


/*
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  
}
*/


/*
- (void)willLoadNextScene:(id)scene;
{
  
}
*/


- (void)dealloc;
{
  [font release];
  [super dealloc];
}


@end
