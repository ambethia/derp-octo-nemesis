//
//  MainMenu.m
//  Aposelene
//
//  Created by Jason Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "MainMenu.h"


@implementation MainMenu


- (void)update:(float)delta;
{
  
}


- (void)draw:(ASView*)view;
{
  glClear(GL_COLOR_BUFFER_BIT);
}


- (void)setup:(ASView*)view;
{
  glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
}


- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{

}


- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  [ASDirector load:@"SquareDemo"];
}


@end
