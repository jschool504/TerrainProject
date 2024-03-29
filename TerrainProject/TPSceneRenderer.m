//
//  TPSceneRenderer.m
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPSceneRenderer.h"
#include <stdio.h>

@interface TPSceneRenderer(InternalMethods)

- (void)changeColorChannel;

@end

@implementation TPSceneRenderer
@synthesize scale = _scale;

- (id)initWithScale:(NSSize)scale {
	self = [super init];
	if (self) {
		rotation = 0;
		colorChannel = 0;
		self.scale = scale;
		
		terrain = [[TPTerrain alloc] init];
		
		camera = at_create_camera(at_create_vertex(300, 100, 300), at_create_rotation(0, 0, 0));
		fog = at_create_fog(VIEW_RANGE, VIEW_RANGE * 2, 0.01, at_create_color(SKY_COLOR.redComponent, SKY_COLOR.greenComponent, SKY_COLOR.blueComponent, SKY_COLOR.alphaComponent), GL_EXP2, GL_NICEST);
		
		
		
		hasRun = NO;
	}
	
	return self;
}

- (void)draw {
	
	if (hasRun == NO) {
		
		//at_set_fog(fog);
		ATBitmap bmImage = at_load_bitmap((char *)[[[NSBundle mainBundle] pathForResource:@"Font" ofType:@"bmp"] cStringUsingEncoding:NSUTF8StringEncoding]);
		
		ATTexture texture = at_create_texture(bmImage.data, GL_RGB, ATOriginPoint, ATZeroSize, NO);
		
		ATPoint points[4];
		
		points[0] = at_create_point(0, 0);
		points[1] = at_create_point(0, texture.size.height);
		points[2] = at_create_point(texture.size.width, 0);
		points[3] = at_create_point(texture.size.width, texture.size.height);
		
		ATPoint texPoints[4];
		
		texPoints[0] = at_create_point(0, 0);
		texPoints[1] = at_create_point(0, 1);
		texPoints[2] = at_create_point(1, 0);
		texPoints[3] = at_create_point(1, 1);
		
		testPoly = at_create_textured_polygon(ATOriginPoint, 4, points, texture, texPoints);
		
		hasRun = YES;
	}
	
	newTime = clock();
	float fps = difftime(newTime, oldTime);
	fps = (1.0 / fps) * 10000000;
	oldTime = newTime;
	
	at_set_camera(camera);
	
	glPushMatrix();
	
	rotation++;
	
	TPAxis *xAxis = [[TPAxis alloc] initWithAxisType:TPAxisTypeX axisLength:1000];
	[xAxis draw];
	
	TPAxis *yAxis = [[TPAxis alloc] initWithAxisType:TPAxisTypeY axisLength:1000];
	[yAxis draw];
	
	TPAxis *zAxis = [[TPAxis alloc] initWithAxisType:TPAxisTypeZ axisLength:1000];
	[zAxis draw];
	
	NSPoint cameraLoc = NSMakePoint(camera.location.x, camera.location.z);
	
	[terrain drawFromPoint:cameraLoc];
	
	glPopMatrix();
	
	//UI
	
	atmosphere_ortho_start(0, self.scale.width, 0, self.scale.height, 0, 10);
	
	drawStringAtPoint([NSString stringWithFormat:@"fps: %.0f\n\nview size: %.0f, %.0f\n\ncamera:\n%s", fps, self.scale.width, self.scale.height, at_string_camera(camera)], nil, NSZeroPoint);
	
	//at_draw_textured_polygon(testPoly, <#int drawMode#>)
	
	atmosphere_ortho_end();
	
	at_unset_camera();
	
	glClearColor(SKY_COLOR.redComponent, SKY_COLOR.greenComponent, SKY_COLOR.blueComponent, SKY_COLOR.alphaComponent);
}

- (void)reshape:(NSSize)size {
	self.scale = size;
}

// Events -- Mouse

- (void)mouseEntered:(NSPoint)point {
	
}

- (void)mouseDown:(NSPoint)point {
	
}

- (void)rightMouseDown:(NSPoint)point {
	
}

- (void)mouseUp:(NSPoint)point {
	
}

- (void)rightMouseUp:(NSPoint)point {
	
}

- (void)mouseMoved:(NSPoint)point {
	
}

- (void)mouseDragged:(NSPoint)point {
	
}

- (void)rightMouseDragged:(NSPoint)point {
	
}

- (void)mouseExited:(NSPoint)point {
	
}

// Events -- Keyboard

#define PI_OVER_180 0.01745329251994

- (void)keyDown:(NSEvent *)theEvent {
	
	//          d c = camera
	//        / | d = destination
	// dist /   | dist = distance to travel
	//    / ang | ang = angle of c
	//  / - |   |
	// c--------a
	
	// i, j, k, l move according to world axes
	
	if ([theEvent.characters isEqualToString:@"I"]) {
		camera.location.y += MOV_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"K"]) {
		camera.location.y -= MOV_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"i"]) {
		camera.location.z -= MOV_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"k"]) {
		camera.location.z += MOV_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"j"]) {
		camera.location.x -= MOV_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"l"]) {
		camera.location.x += MOV_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"w"]) {
		camera.location.x -= sinf(camera.rotation.y * PI_OVER_180) * MOV_SPEED;
		camera.location.y += sinf(camera.rotation.x * PI_OVER_180) * MOV_SPEED;
		camera.location.z -= cosf(camera.rotation.y * PI_OVER_180) * MOV_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"s"]) {
		camera.location.x += sinf(camera.rotation.y * PI_OVER_180) * MOV_SPEED;
		camera.location.y -= sinf(camera.rotation.x * PI_OVER_180) * MOV_SPEED;
		camera.location.z += cosf(camera.rotation.y * PI_OVER_180) * MOV_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"a"]) {
		camera.rotation.y += ROT_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"d"]) {
		camera.rotation.y -= ROT_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"="]) {
		camera.rotation.x += ROT_SPEED;
	}
	
	if ([theEvent.characters isEqualToString:@"-"]) {
		camera.rotation.x -= ROT_SPEED;
	}
	
}

- (void)keyUp:(NSEvent *)theEvent {
	
}
@end
