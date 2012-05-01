//
//  TPSceneRenderer.h
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPAxis.h"
#include "Atmosphere.h"
#import "TPTerrain.h"
#import "TPOpenGLView.h"
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

@interface TPSceneRenderer : NSObject <OpenGLSceneRenderer> {
	int rotation;
	int colorChannel;
	NSTimer *timer;
	
	TPTerrain *terrain;
	
	ATUIState uistate;
}

@property (nonatomic, readwrite) float scale;

- (id)initWithScale:(float)scale;

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
