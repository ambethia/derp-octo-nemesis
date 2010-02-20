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
  CGSize size;
  Vertex2D velocity;
  NSArray* animation;
  int keyframe;
  int frame;
  int delay;
  float timer;
}

- (void)update:(float)delta;

- (void)draw;

- (id)initWithAtlas:(ASAtlas*)_atlas animation:(NSString*)_animation;

@property (nonatomic) CGPoint position;
@property (nonatomic, readonly) CGSize size;
@property (nonatomic, readwrite) Vertex2D velocity;

@end
