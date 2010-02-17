//
//  ASView.h
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>


@class ASDirector;

@interface ASView : UIView
{
  EAGLContext* context;
  GLuint viewFramebuffer;
  GLuint viewRenderbuffer;
  CFTimeInterval lastUpdate;
  GLint backingWidth;
  GLint backingHeight;
  ASDirector* director;
}

- (void)draw;
- (void)mainLoop;
- (BOOL)createBuffers;
- (void)destroyBuffers;

@property (nonatomic, retain) EAGLContext *context;

@end
