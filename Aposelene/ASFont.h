//
//  ASFont.h
//  Aposelene
//
//  Created by Jason L Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#include "ASCommon.h"


#define kMaxCharacters 256

typedef struct {
  int charID;
  CGRect frame;
  CGPoint offset;
  int advance;
} ASFontCharacter;

@class ASTexture;

@interface ASFont : NSObject {
  ASTexture* texture;
	ASFontCharacter* characters;
  ASColor colorFilter;
}

- (id)initWithFontFileNamed:(NSString*)fontName;

- (void)drawText:(NSString*)text atPoint:(CGPoint)point;

- (void)setColorFilterRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha;

@end
