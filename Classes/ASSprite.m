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

@property (nonatomic, retain) NSArray* animation;

@end


@implementation ASSprite

@synthesize atlas;

@synthesize animation;

@synthesize position;

@synthesize velocity;

- (id)initWithAtlas:(ASAtlas*)_atlas animation:(NSString*)_animation;
{
  if (self = [super init])
  {
    [self setAtlas:_atlas];
    [self setAnimation:[[atlas animations] objectForKey:_animation]];
    keyframe = 0;
    frame = 0;
    delay = 0;
    timer = 0.0f;
    velocity = Vertex2DMake(0.0f, 0.0f);
  }
  return self;
}

- (void)dealloc;
{
  [atlas release];
  [animation release];
  [super dealloc];
}

- (void)update:(float)delta;
{
  position.x += (velocity.x * delta);
  position.y += (velocity.y * delta);

  if (timer > delay/1000.0f) {
    // Extracting these values from the dictionary inside the game loop might be a peformance hit.
    // Looking at them every so many (delay) ms should mitigate some of that.
    frame = [(NSNumber*)[(NSDictionary*)[animation objectAtIndex:keyframe] valueForKey:@"Frame"] intValue];
    delay = [(NSNumber*)[(NSDictionary*)[animation objectAtIndex:keyframe] valueForKey:@"Delay"] intValue];
    timer = 0.0f;
    keyframe++;
    if (keyframe >= [animation count]) {
      keyframe = 0;
    }
  }

  timer += delta;
}


- (void)draw;
{
  [atlas drawFrame:frame AtPoint:position];
}

@end
