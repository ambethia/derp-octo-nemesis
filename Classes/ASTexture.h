//
//  ASTexture.h
//  Aposelene
//
//  Created by Jason Perry on 2/18/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface ASTexture : NSObject
{
  GLuint name;
  CGSize size;

}

- (id)initWithImagePath:(NSString*)path;

- (void)drawAtPoint:(CGPoint)point;

@end
