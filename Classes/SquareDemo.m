//
//  SquareDemo.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface SquareDemo : NSObject <ASScene>
{
}

@end


@implementation SquareDemo


- (void)update:(float)delta;
{
}


- (void)draw:(ASView*)view;
{
  static const GLfloat squareVertices[] = {
    120.0f, 200.0f, // BL
    120.0f, 280.0f, // TL
    200.0f, 200.0f, // BR
    200.0f, 280.0f  // TR
  };
	
  static const GLubyte squareColors[] = {
    255, 255,   0, 255,
    0,   255, 255, 255,
    0,     0,   0,   0,
    255,   0, 255, 255,
  };
  
	static float trans = 0.0f;
  glTranslatef((GLfloat)(cosf(trans)*0.5), (GLfloat)(sinf(trans)*0.5f), 0.0f);
	trans += 0.02f;
	
  glClear(GL_COLOR_BUFFER_BIT);
  
  glVertexPointer(2, GL_FLOAT, 0, squareVertices);
  glEnableClientState(GL_VERTEX_ARRAY);
  glColorPointer(4, GL_UNSIGNED_BYTE, 0, squareColors);
  glEnableClientState(GL_COLOR_ARRAY);
  
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glDisableClientState(GL_VERTEX_ARRAY);
  glDisableClientState(GL_COLOR_ARRAY);
}


- (void)setup:(ASView*)view;
{      
  glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}


- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
}


- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  [ASDirector load:@"MainMenu"];
}


@end
