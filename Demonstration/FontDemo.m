//
//  FontDemo.m
//  Aposelene
//
//  Created by Jason L Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface FontDemo : NSObject <ASScene>
{
  ASFont* font;
}

@end


@implementation FontDemo


- (void)update:(float)delta;
{
}


- (void)draw:(ASView*)view;
{
  [font drawText:@"Aposelene by Jason L. Perry" atPoint:CGPointMake(10, 470)];
}


- (void)setup:(ASView*)view;
{
  font = [[ASFont alloc] initWithFontFileNamed:@"PixelFont"];
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  [ASDirector load:@"MainMenu"];
}


- (void)dealloc;
{
  [font release];
  [super dealloc];
}

@end
