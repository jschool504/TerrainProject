//
//  TPTerrain.m
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPTerrain.h"

@implementation TPTerrain
@synthesize heightmap = _heightmap;
@synthesize points = _points;
@synthesize colorChannel = _colorChannel;

- (id)initWithHeightmap:(NSString *)mapPath {
	self = [super init];
	if (self) {
		NSData *imageData = [[NSImage imageNamed:@"heightmap.png"] TIFFRepresentation];
		self.heightmap = [NSBitmapImageRep imageRepWithData:imageData];
	}
	
	return self;
}

- (NSArray *)points {
	if (!_points) {
		
		NSMutableArray *tempArray = [[NSMutableArray alloc] init];
		
		for (int x = 0; x < self.heightmap.size.width; x+=8) {
			for (int y = 0; y < self.heightmap.size.height; y+=8) {
				
				float height = [self heightAtPoint:NSMakePoint(x, y)];
				
				JSColor color = {0, height / 255 + 0.5, 0};
				JSVertex *vertex = [[JSVertex alloc] initWithLocation:x y:height z:y andColor:color];
				[tempArray addObject:vertex];
				
			}
		}
		
		_points = tempArray;
	}
	
	return _points;
}

- (void)rebuildTerrain {
	self.points = nil;
}

- (int)heightAtPoint:(NSPoint)point {
	NSColor *color = [self.heightmap colorAtX:point.x y:point.y];
	float height;
	
	if (self.colorChannel == 0) {
		height = color.redComponent * 510;
	} else if (self.colorChannel == 1) {
		height = color.greenComponent * 510;
	} else if (self.colorChannel == 2) {
		height = color.blueComponent * 510;
	} else {
		height = color.alphaComponent * 510;
	}
	
	return height;
}

- (void)drawFromPoint:(NSPoint)point {
	
	glPushMatrix();
	
	glTranslatef(-self.heightmap.size.width / 2, 0, -self.heightmap.size.height / 2);
	
	glPointSize(5);
	
	for (JSVertex *vertex in self.points) {
		glBegin(GL_POINTS);
		glColor3f(vertex.color.r, vertex.color.g, vertex.color.b);
		[vertex drawVertex];
		glEnd();
	}
	
	glPopMatrix();
}

@end
