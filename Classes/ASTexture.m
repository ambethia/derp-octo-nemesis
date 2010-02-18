//
//  ASTexture.m
//  Aposelene
//
//  Created by Jason Perry on 2/18/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import "ASTexture.h"


@implementation ASTexture


- (id)initWithImagePath:(NSString*)path;
{
	UIImage*     image;
	CGImageRef   reference;
  CGContextRef context;
  GLubyte*     data;

	if(![path isAbsolutePath])
  {
    path = [[NSBundle mainBundle] pathForResource:path ofType:nil];
  }

	image = [[UIImage alloc] initWithContentsOfFile:path];
  reference = [image CGImage];
  size = CGSizeMake(CGImageGetWidth(reference), CGImageGetHeight(reference));

  if (reference)
  {
    // Copy the image data to memory, then bind it to an OpenGL texture.
    data = (GLubyte*) calloc(size.width * size.height * 4, sizeof(GLubyte));
    context = CGBitmapContextCreate(data, size.width, size.height, 8, size.width * 4,
                                    CGImageGetColorSpace(reference), kCGImageAlphaPremultipliedLast);
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
	return self;
}


- (void)drawAtPoint:(CGPoint)point;
{
  const GLfloat spriteVertices[] = {
    point.x, point.y,
    point.x, point.y + size.height,
    point.x + size.width, point.y,  
    point.x + size.width, point.y + size.height
  };

  const GLshort spriteTexcoords[] = {
    0, 1,
    0, 0,
    1, 1,
    1, 0,
  };

  glPushMatrix();
  glEnable(GL_TEXTURE_2D);
  glEnable(GL_BLEND);
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
  glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);

	glVertexPointer(2, GL_FLOAT, 0, spriteVertices);
	glTexCoordPointer(2, GL_SHORT, 0, spriteTexcoords);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

	glDisableClientState(GL_TEXTURE_COORD_ARRAY);  
	glDisableClientState(GL_VERTEX_ARRAY);
  glDisable(GL_BLEND);
	glDisable(GL_TEXTURE_2D);
	glPopMatrix();
}


- (void)dealloc
{
	if(name)
    glDeleteTextures(1, &name);
	
	[super dealloc];
}


@end
