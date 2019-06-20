//
//  TPTerrain.m
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPTerrain.h"
#import "NSImage+OpenGLTexture.h"
#import <QuartzCore/QuartzCore.h>
#include <time.h>

@implementation TPTerrain
@synthesize chunks = _chunks;

- (id)init {
	self = [super init];
	if (self) {
		NSMutableArray *tempChunks = [[NSMutableArray alloc] init];
		
		int seed = 5;
		
		// Create the chunks, tell them where they are and what seed we are using, then stuff them into the mutable array, which is then copy'ed into an immutable array (immutable array's have slightly better performance)
		for (int chunkX = 0; chunkX < MAP_SIZE / CHUNK_SIZE; chunkX++) {
			for (int chunkY = 0; chunkY < MAP_SIZE / CHUNK_SIZE; chunkY++) {
				
				NSPoint chunkPoint = NSMakePoint(CHUNK_SIZE * chunkX, CHUNK_SIZE * chunkY);
				
				TPChunk *chunk = [[TPChunk alloc] initWithLocation:chunkPoint mapSize:MAP_SIZE withSeed:seed];
				chunk.size = CHUNK_SIZE;
				[tempChunks addObject:chunk];
				
			}
		}
		
		self.chunks = [tempChunks copy];
		
	}
	
	return self;
}

- (void)drawFromPoint:(NSPoint)point {
	
	
	
	for (TPChunk *chunk in self.chunks) {
		
		float distance = DistanceToPoint(point, chunk.center);
		
		if (distance <= VIEW_RANGE) {
			clock_t startTime = clock();
			[chunk draw];
			clock_t endTime = clock();
			float dTime = difftime(endTime, startTime) / 1000;
	
			printf("%f\n", dTime / CLOCKS_PER_SEC);
		}
		
		
	}
	
	
	
}

@end
