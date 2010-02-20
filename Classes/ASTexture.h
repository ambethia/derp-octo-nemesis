//
//  ASTexture.h
//  Aposelene
//
//  Created by Jason Perry on 2/18/10.
//  Copyright 2010 Ambethia. All rights reserved.
//
//   (0, 1)     (1, 1)
//       v2     v3
//         +---+         INVERT_TEXTURE_COORDS = 0
//         |   |
//         +---+         This appears to be the traditional way to map
//       v0     v1       S,T coordinates to a surface.
//   (0, 0)     (1, 0)
//
//
//   (0, 0)     (1, 0)
//       v2     v3
//         +---+         INVERT_TEXTURE_COORDS = 1
//         |   |
//         +---+         This compensates for the image being verically
//       v0     v1       flipped by UIImage/CoreGraphics on import.
//   (0, 1)     (1, 1)
//

#import "ASCommon.h"

#define INVERT_TEXTURE_COORDS 1

@interface ASTexture : NSObject
{
  GLuint name;
  CGSize size;
  Quad2D vertices;
  Quad2D coordinates;
}

- (id)initWithImagePath:(NSString*)path;

- (void)drawAtPoint:(CGPoint)point withRect:(CGRect)rect;

@end
