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
  [texture drawAtPoint:CGPointMake(128, 352) withRect:CGRectMake(0, 64, 64, 64)];
  [texture drawAtPoint:CGPointMake(96, 176)];
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
