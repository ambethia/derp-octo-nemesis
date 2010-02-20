//
//  SpriteDemo.m
//  Aposelene
//
//  Created by Jason Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//



#import "Aposelene.h"


@interface SpriteDemo : NSObject <ASScene>
{
  ASAtlas* atlas;
  NSMutableArray* sprites;
}

@end


@implementation SpriteDemo


- (void)update:(float)delta;
{
  for (ASSprite* sprite in sprites)
  {
    if(sprite.position.x <= 0 || sprite.position.x + sprite.size.width >= 320)
    {
      if (sprite.position.x <= 0)
      {
        sprite.position = CGPointMake(0.0f, sprite.position.y);
      }
      else
      {
        sprite.position = CGPointMake(320.0f - sprite.size.width, sprite.position.y);
      }
      sprite.velocity = Vertex2DMake(sprite.velocity.x * -1.0f, sprite.velocity.y);
    }

    if(sprite.position.y <= 0 || sprite.position.y + sprite.size.height >= 480)
    {
      if (sprite.position.y <= 0)
      {
        sprite.position = CGPointMake(sprite.position.x, 0.0f);
      }
      else {
        sprite.position = CGPointMake(sprite.position.x, 480.0f - sprite.size.height);
      }
      sprite.velocity = Vertex2DMake(sprite.velocity.x, sprite.velocity.y * -1.0f);
    }
    [sprite update:delta];
  }
}


- (void)draw:(ASView*)view;
{
  static const GLfloat vertices[] = {
    20.0f, 440.0f, // BL
    20.0f, 460.0f, // TL
    40.0f, 440.0f, // BR
    40.0f, 460.0f  // TR
  };

  glEnableClientState(GL_VERTEX_ARRAY);
  glLoadIdentity();
  glVertexPointer(2, GL_FLOAT, 0, vertices);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
  glDisableClientState(GL_VERTEX_ARRAY);

  [[view font] drawText:[NSString stringWithFormat:@"Sprites: %d", [sprites count]]
                atPoint:CGPointMake(5, 25)];

  for (ASSprite* sprite in sprites) {
    [sprite draw];
  }
}


- (void)setup:(ASView*)view;
{
  srandom(time(NULL));
  NSString *path = [[NSBundle mainBundle] pathForResource:@"tim-hovering" ofType:@"plist"];
  NSDictionary* dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
  atlas = [[ASAtlas alloc] initWithDictionary:dictionary];
  sprites = [[NSMutableArray alloc] init];
  [dictionary release];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event inView:(ASView*)view;
{
  CGPoint touchLocation = [[touches anyObject] locationInView:view];

  if (CGRectContainsPoint(CGRectMake(20, 20, 20, 20), touchLocation))
  {
    [ASDirector load:@"MainMenu"];
    return;
  }

  ASSprite* sprite = [[ASSprite alloc] initWithAtlas:atlas animation:@"Hovering"];
  CGPoint position = [view invertVerticalAxisInPoint:touchLocation];
  position.x -= 32;
  position.y -= 32;

  Vertex2D velocity;
  velocity.x = (random() % 100)-50;
  velocity.y = (random() % 100)-50;
  [sprite setVelocity:velocity];
  [sprite setPosition:position];
  [sprites addObject:sprite];
  [sprite release];
}


- (void)dealloc;
{
  [atlas release];
  [sprites release];
  [super dealloc];
}

@end
