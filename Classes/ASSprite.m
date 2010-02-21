//
//  ASSprite.m
//  Aposelene
//
//  Created by Jason Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "ASSprite.h"
#import "ASAtlas.h"

@interface ASSprite()

@property (nonatomic, retain) ASAtlas* atlas;

@property (nonatomic, retain) NSDictionary* animation;

@end


@implementation ASSprite

@synthesize atlas;
@synthesize animation;
@synthesize animationKey;
@synthesize position;
@synthesize size;
@synthesize velocity;
@synthesize keyframe;

- (id)initWithAtlas:(ASAtlas*)_atlas animationKey:(NSString*)_animationKey;
{
  if (self = [super init])
  {
    [self setAtlas:_atlas];
    
    [self setAnimationKey:_animationKey];
    keyframe = 0;
    frame = 0;
    delay = 0;
    timer = 0.0f;
    velocity = Vertex2DMake(0.0f, 0.0f);
    // Initialize the size that of the first frame.
    // This is probably good enough most of the time.
    size = CGSizeMake([atlas frames][frame].size.width,
                      [atlas frames][frame].size.height);
  }
  return self;
}


- (void)dealloc;
{
  [atlas release];
  [animation release];
  [super dealloc];
}


- (void)setAnimationKey:(NSString *)_animationKey;
{
  [self setAnimation:[[atlas animations] valueForKey:_animationKey]];
  keyframe = 0;
}


- (void)update:(float)delta;
{
  position.x += (velocity.x * delta);
  position.y += (velocity.y * delta);

  if (timer > delay/1000.0f) {
    // Extracting these values from the dictionary inside the game loop might be a peformance hit.
    // Looking at them every so many (delay) ms should mitigate some of that.
    frame = [(NSNumber*)[(NSDictionary*)[[animation valueForKey:@"Frames"] objectAtIndex:keyframe] valueForKey:@"Frame"] intValue];
    delay = [(NSNumber*)[(NSDictionary*)[[animation valueForKey:@"Frames"] objectAtIndex:keyframe] valueForKey:@"Delay"] intValue];
    CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[animation valueForKey:@"Offset"], &offset);
    timer = 0.0f;
    keyframe++;
    if (keyframe >= [[animation valueForKey:@"Frames"] count]) {
      keyframe = 0;
    }
  }

  timer += delta;
}


- (void)draw;
{
  [atlas drawFrame:frame AtPoint:CGPointMake(position.x + offset.x, position.y + offset.y)];
}

@end
