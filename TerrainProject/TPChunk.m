//
//  TPChunk.m
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPChunk.h"
#import "NSImage+Saving.h"
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

@implementation TPChunk
@synthesize location = _location;
@synthesize size = _size;
@synthesize generator = _generator;
@synthesize mapSize = _mapSize;
@synthesize seed = _seed;
@synthesize points = _points;
@synthesize center = _center;

- (id)initWithLocation:(NSPoint)location mapSize:(int)mapSize withSeed:(int)seed {
	self = [super init];
	if (self) {
		self.location = location;
		self.seed = seed;
		self.mapSize = mapSize;
	}
	
	return self;
}

- (void)setSize:(float)size {
	_size = size;
	_privateSize = _size + 1;
}

- (NSArray *)points {
	if (!_points) {
		NSMutableArray *tempPoints = [[NSMutableArray alloc] init];
		
		for (int x = self.location.x; x < self.location.x + _privateSize; x++) {
			for (int y = self.location.y; y < self.location.y + _privateSize; y++) {
				
				NSPoint point = NSMakePoint(x, y);
				JSVertex *vertex = [[JSVertex alloc] initWithLocation:point.x y:[self heightAtPoint:point] z:point.y];
				[tempPoints addObject:vertex];
				
			}
		}
		
		_points = [tempPoints copy];
		
	}
	
	return _points;
}

- (float)heightAtPoint:(NSPoint)point {
	return [self.generator heightOfPoint:point];
}

- (TPTerrainGenerator *)generator {
	if (!_generator) {
		_generator = [[TPTerrainGenerator alloc] initWithSeed:self.seed mapSize:self.mapSize];
	}
	
	return _generator;
}

- (NSPoint)center {
	
	return NSMakePoint(self.location.x + self.size, self.location.y + self.size);
	
}

- (void)draw {
	
	srandom(self.location.x);
	float r = random() % 10;
	r = r / 10;
	srandom(self.location.x * self.location.y + random());
	float g = random() % 10;
	g = g / 10;
	srandom(self.location.x + self.location.y + random());
	float b = random() % 10;
	b = b / 10;
	
	glPushMatrix();
	
	glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
	
	for (int x = 0; x < _privateSize - 1; x++) {
		
		glBegin(GL_TRIANGLE_STRIP);
		
		glColor3f(r, g, b);
		
		for (int y = 0; y < _privateSize; y++) {
			
			JSVertex *vertex = [self.points objectAtIndices:x y:y sideLength:_privateSize];
			JSVertex *vertex2 = [self.points objectAtIndices:x + 1 y:y sideLength:_privateSize];
			
			[vertex drawVertex];
			[vertex2 drawVertex];
			
		}
		
		glEnd();
	}
	
	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
	
	glPopMatrix();
}

@end
