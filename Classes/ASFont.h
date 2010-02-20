//
//  ASFont.h
//  Aposelene
//
//  Created by Jason Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

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
	ASFontCharacter	*characters;
}

- (id)initWithFontFileNamed:(NSString*)fontName;

- (void)drawText:(NSString*)text atPoint:(CGPoint)point;

@end
