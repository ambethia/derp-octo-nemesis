//
//  SquareDemo.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "SquareDemo.h"
#import "ASView.h"


@implementation SquareDemo


- (void)update:(float)delta;
{
}


- (void)draw:(ASView*)view;
{
  static const GLfloat squareVertices[] = {
    -0.5f,  -0.33f,
    0.5f,  -0.33f,
    -0.5f,   0.33f,
    0.5f,   0.33f,
  };
	
  static const GLubyte squareColors[] = {
    255, 255,   0, 255,
    0,   255, 255, 255,
    0,     0,   0,   0,
    255,   0, 255, 255,
  };
  
	static float transY = 0.0f;
  
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
  glTranslatef(0.0f, (GLfloat)(sinf(transY)/2.0f), 0.0f);
	transY += 0.02f;
	
  glClear(GL_COLOR_BUFFER_BIT);
  
  glVertexPointer(2, GL_FLOAT, 0, squareVertices);
  glEnableClientState(GL_VERTEX_ARRAY);
  glColorPointer(4, GL_UNSIGNED_BYTE, 0, squareColors);
  glEnableClientState(GL_COLOR_ARRAY);
  
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
}


- (void)setup:(ASView*)view;
{      
  //    if([Director isInLandscapeMode])
  //    {
  //      glRotatef(-90.0f, 0, 0, 1);
  //      glOrthof(0, screenBounds.size.height, 0, screenBounds.size.width, -1, 1);
  //    }
  //    else
  //    {
  glOrthof(0, view.bounds.size.width, 0, view.bounds.size.height, -1, 1);
  //    }
  glViewport(0, 0, view.bounds.size.width, view.bounds.size.height);
  glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_BLEND_SRC);
  glClearColor(0.2f, 0.2f, 0.2f, 0.0f);
}


- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
}


- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
}


@end
