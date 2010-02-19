//
//  ASAtlas.h
//  Aposelene
//
//  Created by Jason Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//


@class ASTexture;

@interface ASAtlas : NSObject
{
  ASTexture* texture;
  CGRect* frames;
  NSDictionary* animations;
}

- (id)initWithDictionary:(NSDictionary*)dictionary;

- (void)drawFrame:(int)frame AtPoint:(CGPoint)point;

@property (nonatomic, retain) NSDictionary* animations;

@end
