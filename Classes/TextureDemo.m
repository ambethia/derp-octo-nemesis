//
//  TextureDemo.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface TextureDemo : NSObject <ASScene>
{
  ASTexture* texture;
}

@end


@implementation TextureDemo


- (void)update:(float)delta;
{
}


- (void)draw:(ASView*)view;
{
  glClear(GL_COLOR_BUFFER_BIT);
  [texture drawAtPoint:CGPointMake(100, 100)];
}


- (void)setup:(ASView*)view;
{      
  texture = [[ASTexture alloc] initWithImagePath:@"tim-sprite.png"];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  [ASDirector load:@"MainMenu"];
}


@end
