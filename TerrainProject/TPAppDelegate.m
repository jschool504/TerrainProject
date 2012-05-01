//
//  TPAppDelegate.m
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPAppDelegate.h"

@implementation TPAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSView *contentView = self.window.contentView;
	self.window.contentView = [[TPOpenGLView alloc] initWithFrame:[self.window.contentView frame] delegate:[[TPSceneRenderer alloc] initWithScale:contentView.bounds.size.width / 2]];
}

@end
