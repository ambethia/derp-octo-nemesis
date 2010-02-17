//
//  SpriteDemo.m
//  Aposelene
//
//  Created by Jason Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface SpriteDemo : NSObject <ASScene>
{
}

@end


@implementation SpriteDemo


- (void)update:(float)delta;
{
  
}


- (void)draw:(ASView*)view;
{  

  glClear(GL_COLOR_BUFFER_BIT);

}


- (void)setup:(ASView*)view;
{    
  glClearColor(0.0f, 0.2f, 0.5f, 0.0f);
}


- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  
}


- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  [ASDirector load:@"MainMenu"];
}


@end
