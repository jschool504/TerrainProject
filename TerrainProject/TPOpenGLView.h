//
//  TP.h
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

#define SKY_COLOR [NSColor colorWithCalibratedRed:0.3 green:0.3 blue:0.9 alpha:1.0]

@protocol OpenGLSceneRenderer <NSObject>

// Drawing
- (void)draw;

// Events
- (void)reshape:(NSSize)size;
- (void)mouseEntered:(NSPoint)point;
- (void)rightMouseDown:(NSPoint)point;
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

@interface TPOpenGLView : NSOpenGLView {
	NSTimer *timer;
	
	NSSize startingSize;
	
	NSTrackingArea *trackingArea;
}

@property (nonatomic, strong) id<OpenGLSceneRenderer> delegate;

- (id)initWithFrame:(NSRect)frame delegate:(id<OpenGLSceneRenderer>)delegate;

- (NSOpenGLPixelFormat *)createPixelFormat:(NSRect)frame;
- (void)initGL;

@end
