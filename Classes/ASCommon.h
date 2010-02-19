//
//  ASCommon.h
//  Aposelene
//
//  Created by Jason Perry on 2/19/10.
//  Copyright 2010 Ambethia. All rights reserved.
//

#import <OpenGLES/ES1/gl.h>

#pragma mark Vertex2D

typedef struct {
	GLfloat	x;
	GLfloat y;
} Vertex2D;

static inline Vertex2D Vertex2DMake(CGFloat x, CGFloat y)
{
	Vertex2D vertex2D;
	vertex2D.x = x;
	vertex2D.y = y;
	return vertex2D;
}

#pragma mark Quad2D

typedef struct {
	Vertex2D v0;
  Vertex2D v1;
  Vertex2D v2;
  Vertex2D v3;
} Quad2D;

static inline Quad2D Quad2DMake(Vertex2D v0, Vertex2D v1, Vertex2D v2, Vertex2D v3)
{
	Quad2D quad2D;
	quad2D.v0 = v0;
	quad2D.v1 = v1;
	quad2D.v2 = v2;
  quad2D.v3 = v3;
	return quad2D;
}