//
//  TPAxis.m
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPAxis.h"

@implementation TPAxis
@synthesize type = _type;
@synthesize length = _length;

- (id)initWithAxisType:(int)axisType axisLength:(float)length {
	
	self = [super init];
	if (self) {
		self.type = axisType;
		self.length = length;
	}
	
	return self;
}

- (void)draw {
	glBegin(GL_LINES);
	
	if (self.type == TPAxisTypeX) {
		glColor3f(1, 0, 0);
		glVertex3f(-self.length, 0, 0);
		glVertex3f(self.length, 0, 0);
		
	} else if (self.type == TPAxisTypeY) {
		glColor3f(0, 1, 0);
		glVertex3f(0, -self.length, 0);
		glVertex3f(0, self.length, 0);
		
	} else if (self.type == TPAxisTypeZ) {
		glColor3f(0, 0, 1);
		glVertex3f(0, 0, -self.length);
		glVertex3f(0, 0, self.length);
		
	}
	
	glEnd();
}
@end
