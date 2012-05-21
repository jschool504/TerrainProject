//
//  JSVertex.m
//  TerrainProject
//
//  Created by Jeremy School on 4/27/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "JSVertex.h"

@implementation JSVertex

@synthesize x, y, z, nx, ny, nz, color, tx, ty;
@synthesize texId = _texId;

//Init methods

- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc {
	self = [super init];
	if (self) {
		x = xLoc;
		y = yLoc;
		z = zLoc;
	}
	
	return self;
}

- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc andColor:(JSColor)newColor {
	self = [super init];
	if (self) {
		x = xLoc;
		y = yLoc;
		z = zLoc;
		
		color = newColor;
	}
	
	return self;
}

- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc andNormalX:(float)normalX normalY:(float)normalY normalZ:(float)normalZ {
	self = [super init];
	if (self) {
		x = xLoc;
		y = yLoc;
		z = zLoc;
		
		nx = normalX;
		ny = normalY;
		nz = normalZ;
	}
	
	return self;
}

- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc andTextureCoordinates:(float)textureX textureCoordY:(float)textureY {
	self = [super init];
	if (self) {
		x = xLoc;
		y = yLoc;
		z = zLoc;
		
		tx = textureX;
		ty = textureY;
	}
	
	return self;
}

- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc andColor:(JSColor)newColor andNormalX:(float)normalX normalY:(float)normalY normalZ:(float)normalZ andTextureCoordinates:(float)textureX textureCoordY:(float)textureY {
	self = [super init];
	if (self) {
		x = xLoc;
		y = yLoc;
		z = zLoc;
		
		color = newColor;
		
		nx = normalX;
		ny = normalY;
		nz = normalZ;
		
		tx = textureX;
		ty = textureY;
	}
	
	return self;
}

//End of Init methods

//Log the vertex coords
- (void)printLoc {
	NSLog(@"x: %f, y: %f, z: %f", x, y, z);
}

//drawVertex requires a glBegin(glDrawMode) call to draw, and a glEnd() call to finish drawing
- (void)drawVertex {
	
	//glColor3f(r, g, b);
	glVertex3f(x, y, z);
	
}

@end
