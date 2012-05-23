//
//  TP.m
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPOpenGLView.h"

@implementation TPOpenGLView
@synthesize delegate = _delegate;


- (id)initWithFrame:(NSRect)frame delegate:(id<OpenGLSceneRenderer>)delegate {
	NSOpenGLPixelFormat *pixelFormat = [self createPixelFormat:frame];
	
    //Main Init
	if (pixelFormat != nil) {
		self = [super initWithFrame:frame pixelFormat:pixelFormat];
		if (self) {
			[[self openGLContext] makeCurrentContext];
			
			startingSize = self.frame.size;
			
			[self.window setAcceptsMouseMovedEvents:YES];
			
			self.delegate = delegate;
			[self initGL];
			
			timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(drawRect:) userInfo:nil repeats:YES];
		}
	}
	
	
    return self;
}

- (NSOpenGLPixelFormat *)createPixelFormat:(NSRect)frame {
	NSOpenGLPixelFormatAttribute pixelAttribs[ 16 ];
	int pixNum = 0;
	NSOpenGLPixelFormat *pixelFormat;
	
	pixelAttribs[ pixNum++ ] = NSOpenGLPFADoubleBuffer;
	pixelAttribs[ pixNum++ ] = NSOpenGLPFAAccelerated;
	pixelAttribs[ pixNum++ ] = NSOpenGLPFAColorSize;
	pixelAttribs[ pixNum++ ] = 32;
	pixelAttribs[ pixNum++ ] = NSOpenGLPFADepthSize;
	pixelAttribs[ pixNum++ ] = 32;
	
	
	pixelAttribs[ pixNum ] = 0;
	pixelFormat = [ [ NSOpenGLPixelFormat alloc ]
                   initWithAttributes:pixelAttribs ];
	
	return pixelFormat;
}

- (void)reshape {
	NSRect sceneBounds;
	
	[[self openGLContext] update];
	sceneBounds = [self bounds];
	glViewport(0, 0, sceneBounds.size.width, sceneBounds.size.height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(45.0, sceneBounds.size.width / sceneBounds.size.height, 0.1, 5000.0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	
	[self.delegate reshape:sceneBounds.size];
	
	
}

- (void)initGL {
	
	glClearColor(SKY_COLOR.redComponent, SKY_COLOR.greenComponent, SKY_COLOR.blueComponent, SKY_COLOR.alphaComponent);
	glClearDepth(1.0);
	
	glDepthFunc(GL_LESS);
	glEnable(GL_DEPTH_TEST);
	
	glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
	
	glHint(GL_POLYGON_SMOOTH, GL_NICEST);
	
	glEnable(GL_CULL_FACE);
}

- (void)drawRect:(NSRect)dirtyRect {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();
	
	[self.delegate draw];
	
	[[self openGLContext] flushBuffer];
}

#pragma mark Events

- (BOOL)acceptsFirstResponder {
	return YES;
}

- (void)updateTrackingAreas {
	[super updateTrackingAreas];
	if (trackingArea) {
		[self removeTrackingArea:trackingArea];
	}
	
	NSTrackingAreaOptions options = NSTrackingInVisibleRect | NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow;
	trackingArea = [[NSTrackingArea alloc] initWithRect:NSZeroRect options:options owner:self userInfo:nil];
	[self addTrackingArea:trackingArea];
}

// Events -- Mouse

- (void)mouseEntered:(NSEvent *)theEvent {
	[self.delegate mouseEntered:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

- (void)mouseDown:(NSEvent *)theEvent {
	[self.delegate mouseDown:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

- (void)rightMouseDown:(NSEvent *)theEvent {
	[self.delegate rightMouseDown:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

- (void)mouseUp:(NSEvent *)theEvent {
	[self.delegate mouseUp:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

- (void)rightMouseUp:(NSEvent *)theEvent {
	[self.delegate rightMouseUp:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

- (void)mouseMoved:(NSEvent *)theEvent {
	[self.delegate mouseMoved:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

- (void)mouseDragged:(NSEvent *)theEvent {
	[self.delegate mouseDragged:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

- (void)rightMouseDragged:(NSEvent *)theEvent {
	[self.delegate rightMouseDragged:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

- (void)mouseExited:(NSEvent *)theEvent {
	[self.delegate mouseExited:[self convertPoint:theEvent.locationInWindow toView:nil]];
}

// Events -- Keyboard

- (void)keyDown:(NSEvent *)theEvent {
	[self.delegate keyDown:theEvent];
}

- (void)keyUp:(NSEvent *)theEvent {
	
}

@end
