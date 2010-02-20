//
//  ASView.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES1/glext.h>

#import "ASView.h"
#import "ASDirector.h"
#import "ASFont.h"

#define SHOW_FPS 1

@interface ASView()

- (void)draw;

- (void)mainLoop;

- (BOOL)createBuffers;
- (void)destroyBuffers;

@end


@implementation ASView

@synthesize context;

@synthesize font = _font;

+ (Class)layerClass;
{
  return [CAEAGLLayer class];
}


- (id)initWithFrame:(CGRect)frame;
{
  if (self = [super initWithFrame:frame])
  {
    CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
    eaglLayer.opaque = YES;
    eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],
                                    kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8,
                                    kEAGLDrawablePropertyColorFormat, nil];
    
    context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    
    if (!context || ![EAGLContext setCurrentContext:context])
		{
      [self release];
      return nil;
    }
    lastUpdate = CFAbsoluteTimeGetCurrent();
    director = [ASDirector instance];

    _font = [[ASFont alloc] initWithFontFileNamed:@"silkscreen"];
  }
  return self;
}


- (void)layoutSubviews;
{
  [EAGLContext setCurrentContext:context];
  [self destroyBuffers];
  [self createBuffers];
  [self draw];
}


- (void)dealloc;
{
  if ([EAGLContext currentContext] == context)
    [EAGLContext setCurrentContext:nil];
  [_font release];
  [context release];
  [super dealloc];
}


- (void)mainLoop;
{
  CFTimeInterval time;
  float          delta;
  static float   _fps = 0;

  while (true)
  {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    while(CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.002, TRUE) == kCFRunLoopRunHandledSource);
    time  = CFAbsoluteTimeGetCurrent();
    delta = (time - lastUpdate);
    
    [[director scene] update:delta];
    [self draw];

    if (SHOW_FPS)
    {
      _fps += delta;
      if(_fps > 0.25f)
      {
        _fps = 0;
        fps = 1.0f / (time - lastUpdate);
      }
    }

    lastUpdate = time;
    [pool release];
  }
}


- (void)draw;
{
  glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);

  glClear(GL_COLOR_BUFFER_BIT);
  if(SHOW_FPS)
    [_font drawText:[NSString stringWithFormat:@"FPS: %1.0f", fps] atPoint:CGPointMake(5, 15)];

  [[director scene] draw:self];
  glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
  [context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

- (BOOL) createBuffers;
{
  glGenFramebuffersOES(1, &viewFramebuffer);
  glGenRenderbuffersOES(1, &viewRenderbuffer);

  glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
  glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
  [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:(CAEAGLLayer*)self.layer];
  glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, viewRenderbuffer);

  glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
  glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);

  if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
    NSLog(@"Failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
    return NO;
  }
  [director setupOpenGL];
  [[director scene] setup:self];
  return YES;  
}


- (void)destroyBuffers;
{    
  glDeleteFramebuffersOES(1, &viewFramebuffer);
  viewFramebuffer = 0;
  glDeleteRenderbuffersOES(1, &viewRenderbuffer);
  viewRenderbuffer = 0;  
}


#pragma mark Touches

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
{
  if ([[director scene] respondsToSelector:@selector(touchesBegan:withEvent:inView:)]) {
    [[director scene] touchesBegan:touches withEvent:event inView:self];
  }
}


- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event;
{
  if ([[director scene] respondsToSelector:@selector(touchesMoved:withEvent:inView:)]) {
    [[director scene] touchesMoved:touches withEvent:event inView:self];
  }
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event;
{
  if ([[director scene] respondsToSelector:@selector(touchesEnded:withEvent:inView:)]) {
    [[director scene] touchesEnded:touches withEvent:event inView:self];
  }  
}


#pragma mark Point Conversion

- (CGPoint)invertVerticalAxisInPoint:(CGPoint)point;
{
  point.y = [self bounds].size.height - point.y;
  return point;
}


@end
