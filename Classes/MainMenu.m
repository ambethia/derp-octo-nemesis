//
//  MainMenu.m
//  Aposelene
//
//  Created by Jason Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface MainMenu : NSObject <ASScene>
{
}

@end


@implementation MainMenu


- (void)update:(float)delta;
{
  
}


- (void)draw:(ASView*)view;
{  
  static const GLfloat vertices_btn1[] = {
     20.0f, 400.0f, // BL
     20.0f, 440.0f, // TL
    300.0f, 400.0f, // BR
    300.0f, 440.0f  // TR
  };

  static const GLfloat vertices_btn2[] = {
     20.0f, 340.0f, // BL
     20.0f, 380.0f, // TL
    300.0f, 340.0f, // BR
    300.0f, 380.0f  // TR
  };

  static const GLfloat vertices_btn3[] = {
     20.0f, 280.0f, // BL
     20.0f, 320.0f, // TL
    300.0f, 280.0f, // BR
    300.0f, 320.0f  // TR
  };

  glEnableClientState(GL_VERTEX_ARRAY);
  
  glLoadIdentity();

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn1);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
  
  glVertexPointer(2, GL_FLOAT, 0, vertices_btn2);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn3);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
  
  glDisableClientState(GL_VERTEX_ARRAY);
}


- (void)setup:(ASView*)view;
{ 
  glClearColor(0.2f, 0.2f, 0.2f, 0.0f);
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  CGPoint touchLocation = [[touches anyObject] locationInView:view];  
  
  if (CGRectContainsPoint(CGRectMake(20, 40, 300, 40), touchLocation))
  {
    [ASDirector load:@"SquareDemo"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 100, 300, 40), touchLocation))
  {
    [ASDirector load:@"TextureDemo"];
  }
  
  if (CGRectContainsPoint(CGRectMake(20, 160, 300, 40), touchLocation))
  {
    [ASDirector load:@""];
  }
}


@end
