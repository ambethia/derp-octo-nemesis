//
//  ASSprite.h
//  Aposelene
//
//  Created by Jason Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "ASCommon.h"


@class ASAtlas;

@interface ASSprite : NSObject {
  ASAtlas* atlas;
  CGPoint position;
  CGPoint offset;
  CGSize size;
  Vertex2D velocity;
  NSDictionary* animation;
  NSString* animationKey;
  int keyframe;
  int frame;
  int delay;
  float timer;
}

- (void)update:(float)delta;

- (void)draw;

- (id)initWithAtlas:(ASAtlas*)_atlas animationKey:(NSString*)_animationKey;

@property (nonatomic) CGPoint position;
@property (nonatomic, readonly) CGSize size;
@property (nonatomic, readwrite) Vertex2D velocity;
@property (nonatomic, retain) NSString* animationKey;
@property (nonatomic, readonly) int keyframe;


@end
