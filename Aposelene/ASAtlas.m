//
//  ASAtlas.m
//  Aposelene
//
//  Created by Jason L Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "ASAtlas.h"
#import "ASTexture.h"


@implementation ASAtlas

@synthesize animations;
@synthesize frames;

- (id)initWithDictionary:(NSDictionary*)dictionary;
{
  if (self = [super init])
  {
    texture = [[ASTexture alloc] initWithImagePath:[dictionary objectForKey:@"Texture"]];
    animations = [(NSDictionary*)[dictionary objectForKey:@"Animations"] copy];
    NSArray* _frames = (NSArray*)[dictionary objectForKey:@"Frames"];
    frames = calloc([_frames count], sizeof(CGRect));
    for (int i = 0; i < [_frames count]; i++)
    {
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[_frames objectAtIndex:i], &frames[i]);
    }
  }
  return self;
}

- (void)drawFrame:(int)frame AtPoint:(CGPoint)point;
{
  [texture drawAtPoint:point withRect:frames[frame]];
}

- (void)dealloc;
{
  if (frames)
    free(frames);

  [texture release];
  [animations release];
  [super dealloc];
}

@end
