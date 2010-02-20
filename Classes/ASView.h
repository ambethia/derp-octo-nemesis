//
//  ASView.h
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>


@class ASDirector;
@class ASFont;

@interface ASView : UIView
{
  EAGLContext* context;
  GLuint viewFramebuffer;
  GLuint viewRenderbuffer;
  CFTimeInterval lastUpdate;
  GLint backingWidth;
  GLint backingHeight;
  ASDirector* director;
  float fps;
  ASFont* _font;
}

- (CGPoint)invertVerticalAxisInPoint:(CGPoint)point;

@property (nonatomic, retain, readonly) EAGLContext *context;

@property (nonatomic, readonly) ASFont* font;

@end
