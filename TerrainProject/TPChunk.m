//
//  TPChunk.m
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPChunk.h"
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
				
				/*
				       4
				       |
				   1---0---3
				       |
				       2
				 */
				
				float localHeights[5] = {
					vertex.y,
					[self heightAtPoint:NSMakePoint(vertex.x - 1, vertex.z)],
					[self heightAtPoint:NSMakePoint(vertex.x, vertex.z - 1)],
					[self heightAtPoint:NSMakePoint(vertex.x + 1, vertex.z)],
					[self heightAtPoint:NSMakePoint(vertex.x, vertex.z + 1)]};
				
				// I <3 sloped lighting :-)
				float lightSlope = 1 - (localHeights[1] - localHeights[0]) / LIGHTNING_SOFTNESS;
				
				if (lightSlope > MAX_LIGHT) {
					lightSlope = MAX_LIGHT;
				}
				
				if (lightSlope < MIN_LIGHT) {
					lightSlope = MIN_LIGHT;
				}
				
				vertex.light = lightSlope;
				
				qsort(localHeights, 5, sizeof(float), compare_elements);
				
				float slope = localHeights[4] - localHeights[0]; // Subtract the highest value from the lowest and use that to color the terrain
				
				float rVal = rand() % 10;
				rVal = rVal / 200;
				
				if (slope < MAX_GRASS_SLOPE) {
					JSColor color = {0.0, 0.5 + rVal, 0.0};
					vertex.color = color;
				} else if (slope < MAX_DIRT_SLOPE) {
					JSColor color = {0.5 + rVal, 0.25 + rVal, 0.025 + rVal};
					vertex.color = color;
				} else if (slope < MAX_ROCK_SLOPE) {
					JSColor color = {0.5 + rVal, 0.5 + rVal, 0.5 + rVal};
					vertex.color = color;
				} else {
					JSColor color = {1.0, 0.0, 1.0};
					vertex.color = color;
				}
				
				//NSLog(@"%f", vertex.light);
				
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
	
	// This magical bit of code gives a random (but deterministic) color every time it's run. I use that ( see glcolor3f(r, g, b) )
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
	
	if (DRAW_LINE == YES) {
		glPolygonMode(GL_FRONT_AND_BACK, GL_LINE); // By using GL_FILL instead of GL_LINE, one can toggle the lovely wireframe mode on and off.
	}
	
	/*
	clock_t startTime = clock();
	clock_t endTime = clock();
	float dTime = difftime(endTime, startTime);
	
	NSLog(@"%f", dTime / 1000);
	*/
	
	for (int x = 0; x < _privateSize - 1; x++) {
		
		glBegin(GL_TRIANGLE_STRIP);
		
		//glColor3f(r, g, b); // down here, to make each chunk a different color
		
		for (int y = 0; y < _privateSize; y++) {
			
			// Ah, I thought I was using NSArray+TwoD somewhere. Now I know where.
			JSVertex *vertex = [self.points objectAtIndices:x y:y sideLength:_privateSize];
			JSVertex *vertex2 = [self.points objectAtIndices:x + 1 y:y sideLength:_privateSize];
			
			glColor3f(vertex.color.r * vertex.light, vertex.color.g * vertex.light, vertex.color.b * vertex.light);
			[vertex drawVertex];
			
			glColor3f(vertex2.color.r * vertex2.light, vertex2.color.g * vertex2.light, vertex2.color.b * vertex2.light);
			[vertex2 drawVertex];
			
		}
		
		glEnd();
	}
	
	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
	
	glPopMatrix();
}

int compare_elements(const void *a, const void *b) {
	
	const float *ia = (const float *)a;
	const float *ib = (const float *)b;
	
	return *ia - *ib;
	
}

@end
