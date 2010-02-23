//
//  OpeningScene.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "OpeningScene.h"


@implementation OpeningScene


- (void)update:(float)delta;
{
  
}


- (void)draw:(ASView*)view;
{
  [font drawText:@"Welcome to Aposelene." atPoint:CGPointMake(10, 470)];
  NSLog(@"Hello %@", font);

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
