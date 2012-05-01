//
//  TPChunk.m
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPChunk.h"

@implementation TPChunk
@synthesize location = _location;
@synthesize heightmap = _heightmap;
@synthesize points = _points;

- (id)initWithLocation:(NSPoint)location heightmap:(NSBitmapImageRep *)heightmap {
	self = [super init];
	if (self) {
		self.location = location;
		self.heightmap = heightmap;
	}
	
	return self;
}

@end
