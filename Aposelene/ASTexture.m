//
//  ASTexture.m
//  Aposelene
//
//  Created by Jason L Perry on 2/18/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import <OpenGLES/ES1/gl.h>
#import <UIKit/UIKit.h>

#import "ASTexture.h"
#import "ASCommon.h"


@interface ASTexture()

- (void)draw;

- (void)reset;

@end


@implementation ASTexture

- (id)initWithImagePath:(NSString*)path;
{
	UIImage*     image;
	CGImageRef   reference;
  CGContextRef context;
  GLubyte*     data;

  if (self = [super init])
  {
    if(![path isAbsolutePath])
      path = [[NSBundle mainBundle] pathForResource:path ofType:nil];

    image = [[UIImage alloc] initWithContentsOfFile:path];
    reference = [image CGImage];
    size = CGSizeMake(CGImageGetWidth(reference), CGImageGetHeight(reference));

    if (reference)
    {
      // Copy the image data to memory, then bind it to an OpenGL texture.
      data = (GLubyte*) calloc(size.width * size.height * 4, sizeof(GLubyte));
      context = CGBitmapContextCreate(data, size.width, size.height, 8, size.width * 4,
                                      CGImageGetColorSpace(reference), kCGImageAlphaPremultipliedLast);
      if (!INVERT_TEXTURE_COORDS) {
        // Compensate for CoreGraphics' reveresed y/t axis
        CGContextTranslateCTM (context, 0, size.height);
        CGContextScaleCTM (context, 1.0, -1.0);
      }
      CGContextDrawImage(context, CGRectMake(0.0, 0.0, size.width, size.height), reference);
      CGContextRelease(context);
      glGenTextures(1, &name);
      glBindTexture(GL_TEXTURE_2D, name);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, size.width, size.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
      free(data);
    }
    [image release];
    [self reset];
  }
  return self;
}


- (void)draw;
{
  glPushMatrix();
  glEnable(GL_TEXTURE_2D);
  glEnable(GL_BLEND);
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
  glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);

  glBindTexture(GL_TEXTURE_2D, name);

	glVertexPointer(2, GL_FLOAT, 0, &vertices);
	glTexCoordPointer(2, GL_FLOAT, 0, &coordinates);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	glDisableClientState(GL_VERTEX_ARRAY);
  glDisable(GL_BLEND);
	glDisable(GL_TEXTURE_2D);
	glPopMatrix();
}


- (void)drawAtPoint:(CGPoint)point withRect:(CGRect)rect;
{
  GLfloat xRatio = 1.0f / size.width;
  GLfloat yRatio = 1.0f / size.height;

  GLfloat s0 = xRatio * rect.origin.x;
  GLfloat t0 = yRatio * rect.origin.y;
  GLfloat s1 = xRatio * rect.size.width  + s0;
  GLfloat t1 = yRatio * rect.size.height + t0;

  vertices.v0.x = point.x;
  vertices.v0.y = point.y;
  vertices.v1.x = point.x + rect.size.width;
  vertices.v1.y = point.y;
  vertices.v2.x = point.x;
  vertices.v2.y = point.y + rect.size.height;
  vertices.v3.x = point.x + rect.size.width;
  vertices.v3.y = point.y + rect.size.height;

  if (INVERT_TEXTURE_COORDS)
  {
    coordinates.v0.x = s0;
    coordinates.v0.y = t1;
    coordinates.v1.x = s1;
    coordinates.v1.y = t1;
    coordinates.v2.x = s0;
    coordinates.v2.y = t0;
    coordinates.v3.x = s1;
    coordinates.v3.y = t0;
  }
  else
  {
    coordinates.v0.x = s0;
    coordinates.v0.y = t0;
    coordinates.v1.x = s1;
    coordinates.v1.y = t0;
    coordinates.v2.x = s0;
    coordinates.v2.y = t1;
    coordinates.v3.x = s1;
    coordinates.v3.y = t1;
  }

  [self draw];
}


- (void)reset;
{
  Vertex2D v0, v1, v2, v3;
  Vertex2D t0, t1, t2, t3;

  v0 = Vertex2DMake(0.0f,              0.0f);
  v1 = Vertex2DMake(0.0f + size.width, 0.0f);
  v2 = Vertex2DMake(0.0f,              0.0f + size.height);
  v3 = Vertex2DMake(0.0f + size.width, 0.0f + size.height);

  vertices = Quad2DMake(v0, v1, v2, v3);

  t0 = Vertex2DMake(0.0f, 0.0f);
  t1 = Vertex2DMake(1.0f, 0.0f);
  t2 = Vertex2DMake(0.0f, 1.0f);
  t3 = Vertex2DMake(1.0f, 1.0f);

  coordinates = Quad2DMake(t0, t1, t2, t3);
}


- (void)dealloc;
{
	if(name)
    glDeleteTextures(1, &name);

	[super dealloc];
}


@end
