//
//  ASTexture.h
//  Aposelene
//
//  Created by Jason Perry on 2/18/10.
//  Copyright 2010 Ambethia. All rights reserved.
//
//   (0, 1)     (1, 1)
//       v2     v3
//         +---+
//         |   |
//         +---+
//       v0     v1
//   (0, 0)     (1, 0)
//

#import "Aposelene.h"


@interface ASTexture : NSObject
{
  GLuint name;
  CGSize size;
  Quad2D vertices;
  Quad2D coordinates;
}

- (id)initWithImagePath:(NSString*)path;
- (void)draw;
- (void)drawAtPoint:(CGPoint)point;
- (void)drawAtPoint:(CGPoint)point withRect:(CGRect)rect;
- (void)reset;

@end
