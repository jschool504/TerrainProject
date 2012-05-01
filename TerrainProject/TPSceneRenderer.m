//
//  TPSceneRenderer.m
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPSceneRenderer.h"

@interface TPSceneRenderer(InternalMethods)

- (void)changeColorChannel;

@end

@implementation TPSceneRenderer
@synthesize scale = _scale;

- (id)initWithScale:(float)scale {
	self = [super init];
	if (self) {
		rotation = 0;
		colorChannel = 0;
		self.scale = scale;
		
		atmosphere_init(&uistate);
		
		terrain = [[TPTerrain alloc] initWithHeightmap:@"heightmap.png"];
	}
	
	return self;
}

- (void)draw {
	
	gluLookAt(1500, 1000, 0, 0, 0, 0, 0, 1, 0);
	//gluLookAt(0, 0, 0, 0, 0, -6, 0, 1, 0);
	//glTranslatef(0, 0, -6);
	
	glPushMatrix();
	
	//glRotatef(rotation, 0, 1, 0);
	
	rotation++;
	
	TPAxis *xAxis = [[TPAxis alloc] initWithAxisType:TPAxisTypeX axisLength:1000];
	[xAxis draw];
	
	TPAxis *yAxis = [[TPAxis alloc] initWithAxisType:TPAxisTypeY axisLength:1000];
	[yAxis draw];
	
	TPAxis *zAxis = [[TPAxis alloc] initWithAxisType:TPAxisTypeZ axisLength:1000];
	[zAxis draw];
	
	[terrain drawFromPoint:NSZeroPoint];
	
	glPopMatrix();
	
	//UI
	
	glPushMatrix();
	
	glMatrixMode(GL_PROJECTION);
	glPushMatrix();
	glLoadIdentity();
	glOrtho(0, self.scale * 2, 0, self.scale * 2, -1, 1);
	glMatrixMode(GL_MODELVIEW);
	glPushMatrix();
	glLoadIdentity();
	
	atmosphere_start(&uistate);
	
	if (do_button(1, ATMakeRect(ATMakePoint(300, 10), ATMakeSize(90, 30)), &uistate)) {
		[self changeColorChannel];
	}
	
	atmosphere_finish(&uistate);
	
	/*
	glTranslatef(uistate->mousePoint->x, uistate->mousePoint->y, 0);
	
	glBegin(GL_QUADS);
	
	glColor3f(1, 1, 1);
	
	glVertex3f(0, 0, 0);
	glVertex3f(0, 32, 0);
	glVertex3f(96, 32, 0);
	glVertex3f(96, 0, 0);
	
	glEnd();
	*/
	
	glMatrixMode(GL_PROJECTION);
	glPopMatrix();
	glMatrixMode(GL_MODELVIEW);
	glPopMatrix();
	
	glPopMatrix();
	
}

- (void)reshape:(NSSize)size {
	//Resize UI elements
}

// Events -- Mouse

- (void)mouseEntered:(NSPoint)point {
	
}

- (void)mouseDown:(NSPoint)point {
	uistate.mouseDown = YES;
}

- (void)rightMouseDown:(NSPoint)point {
	
}

- (void)mouseUp:(NSPoint)point {
	uistate.mouseDown = NO;
}

- (void)rightMouseUp:(NSPoint)point {
	
}

- (void)mouseMoved:(NSPoint)point {
	ATPoint atPoint = ATMakePoint(point.x, point.y);
	uistate.mousePoint = atPoint;
}

- (void)mouseDragged:(NSPoint)point {
	
}

- (void)rightMouseDragged:(NSPoint)point {
	
}

- (void)mouseExited:(NSPoint)point {
	
}

// Events -- Keyboard

- (void)keyDown:(NSEvent *)theEvent {
	
}

- (void)keyUp:(NSEvent *)theEvent {
	
}

- (void)runMe {
	[self draw];
}

- (void)changeColorChannel {
	colorChannel++;
	if (colorChannel > 3) {
		colorChannel = 0;
	}
	
	terrain.colorChannel = colorChannel;
	[terrain rebuildTerrain];
}

@end
