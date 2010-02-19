//
//  Texture2Demo.m
//  Aposelene
//
//  Created by Jason Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface Texture2Demo : NSObject <ASScene>
{
  ASTexture* texture;
}

@end


@implementation Texture2Demo


- (void)update:(float)delta;
{
}


- (void)draw:(ASView*)view;
{
  glClear(GL_COLOR_BUFFER_BIT);
  [texture drawAtPoint:CGPointMake(128, 208) withRect:CGRectMake(0, 64, 64, 64)];
}


- (void)setup:(ASView*)view;
{      
  texture = [[ASTexture alloc] initWithImagePath:@"tim-hovering.png"];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  [ASDirector load:@"MainMenu"];
}


@end
