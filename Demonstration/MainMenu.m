//
//  MainMenu.m
//  Aposelene
//
//  Created by Jason L Perry on 2/17/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "Aposelene.h"


@interface MainMenu : NSObject <ASScene>
{
  ASFont* font;
}

@end


@implementation MainMenu


- (void)update:(float)delta;
{

}


- (void)draw:(ASView*)view;
{
  static const GLfloat vertices_btn1[] = {
     20.0f, 430.0f, // BL
     20.0f, 460.0f, // TL
    300.0f, 430.0f, // BR
    300.0f, 460.0f  // TR
  };

  static const GLfloat vertices_btn2[] = {
     20.0f, 380.0f, // BL
     20.0f, 410.0f, // TL
    300.0f, 380.0f, // BR
    300.0f, 410.0f  // TR
  };

  static const GLfloat vertices_btn3[] = {
     20.0f, 330.0f, // BL
     20.0f, 360.0f, // TL
    300.0f, 330.0f, // BR
    300.0f, 360.0f  // TR
  };

  static const GLfloat vertices_btn4[] = {
     20.0f, 280.0f, // BL
     20.0f, 310.0f, // TL
    300.0f, 280.0f, // BR
    300.0f, 310.0f  // TR
  };

  static const GLfloat vertices_btn5[] = {
     20.0f, 230.0f, // BL
     20.0f, 260.0f, // TL
    300.0f, 230.0f, // BR
    300.0f, 260.0f  // TR
  };

  static const GLfloat vertices_btn6[] = {
     20.0f, 180.0f, // BL
     20.0f, 210.0f, // TL
    300.0f, 180.0f, // BR
    300.0f, 210.0f  // TR
  };

  static const GLfloat vertices_btn7[] = {
     20.0f, 130.0f, // BL
     20.0f, 160.0f, // TL
    300.0f, 130.0f, // BR
    300.0f, 160.0f  // TR
  };

  static const GLfloat vertices_btn8[] = {
    20.0f,   80.0f, // BL
    20.0f,  110.0f, // TL
    300.0f,  80.0f, // BR
    300.0f, 110.0f  // TR
  };

  static const GLfloat vertices_btn9[] = {
    20.0f,  30.0f, // BL
    20.0f,  60.0f, // TL
    300.0f, 30.0f, // BR
    300.0f, 60.0f  // TR
  };

  glEnableClientState(GL_VERTEX_ARRAY);

  glLoadIdentity();

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn1);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn2);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn3);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn4);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn5);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn6);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn7);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn8);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glVertexPointer(2, GL_FLOAT, 0, vertices_btn9);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  [font drawText:@"Square"    atPoint:CGPointMake(25, 447)];
  [font drawText:@"Texture"   atPoint:CGPointMake(25, 397)];
  [font drawText:@"Sprite"    atPoint:CGPointMake(25, 347)];
  [font drawText:@"Font"      atPoint:CGPointMake(25, 297)];
  [font drawText:@"Animation" atPoint:CGPointMake(25, 247)];
  [font drawText:@"Landscape" atPoint:CGPointMake(25, 197)];

  glDisableClientState(GL_VERTEX_ARRAY);
}


- (void)setup:(ASView*)view;
{
  glClearColor(0.2f, 0.2f, 0.2f, 0.0f);
  font = [[ASFont alloc] initWithFontFileNamed:@"PixelFont"];
  [font setColorFilterRed:0.2f green:0.2f blue:0.2f alpha:1.0f];

}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  CGPoint touchLocation = [[touches anyObject] locationInView:view];

  if (CGRectContainsPoint(CGRectMake(20, 20, 300, 30), touchLocation))
  {
    [ASDirector load:@"SquareDemo"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 70, 300, 30), touchLocation))
  {
    [ASDirector load:@"TextureDemo"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 120, 300, 30), touchLocation))
  {
    [ASDirector load:@"SpriteDemo"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 170, 300, 30), touchLocation))
  {
    [ASDirector load:@"FontDemo"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 220, 300, 30), touchLocation))
  {
    [ASDirector load:@"AnimationDemo"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 270, 300, 30), touchLocation))
  {
    [ASDirector load:@"LandscapeDemo"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 320, 300, 30), touchLocation))
  {
    [ASDirector load:@"7"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 370, 300, 30), touchLocation))
  {
    [ASDirector load:@"8"];
  }

  if (CGRectContainsPoint(CGRectMake(20, 420, 300, 30), touchLocation))
  {
    [ASDirector load:@"9"];
  }

}


@end
