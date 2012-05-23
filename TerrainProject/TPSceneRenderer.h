//
//  TPSceneRenderer.h
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSImage+OpenGLTexture.h"
#import "TPAxis.h"
#import "TPTerrain.h"
#import "TPOpenGLView.h"
#import "TPString.h"

#include "Atmosphere.h"
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

// Do these even need explaining?
#define MOV_SPEED 5 // meters
#define ROT_SPEED 3

@interface TPSceneRenderer : NSObject <OpenGLSceneRenderer> {
	int rotation;
	int colorChannel;
	NSTimer *timer;
	
	TPTerrain *terrain;
	
	ATTexturedPolygon polygon;
	
	TPString *terrainPointsString;
	
	ATCamera camera;
	ATFog fog;
	
	BOOL hasRun;
}

@property (nonatomic, readwrite) NSSize scale;

- (id)initWithScale:(NSSize)scale;

- (void)draw;

// Events
- (void)reshape:(NSSize)size;
- (void)mouseEntered:(NSPoint)point;
- (void)mouseDown:(NSPoint)point;
- (void)rightMouseDown:(NSPoint)point;
- (void)mouseUp:(NSPoint)point;
- (void)rightMouseUp:(NSPoint)point;
- (void)mouseMoved:(NSPoint)point;
- (void)mouseDragged:(NSPoint)point;
- (void)rightMouseDragged:(NSPoint)point;
- (void)mouseExited:(NSPoint)point;
- (void)keyDown:(NSEvent *)theEvent;
- (void)keyUp:(NSEvent *)theEvent;

@end
