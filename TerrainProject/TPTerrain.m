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

@implementation TPTerrain
@synthesize sineWave = _sineWave;
@synthesize noiseMap = _noiseMap;
@synthesize heightmap = _heightmap;
@synthesize points = _points;
@synthesize chunks = _chunks;

- (id)initWithHeightmap:(NSString *)mapPath {
	self = [super init];
	if (self) {
		self.chunks = [[NSMutableArray alloc] init];
		
		for (int chunkX = 0; chunkX < MAP_SIZE / CHUNK_SIZE; chunkX++) {
			for (int chunkY = 0; chunkY < MAP_SIZE / CHUNK_SIZE; chunkY++) {
				
				NSPoint chunkPoint = NSMakePoint(CHUNK_SIZE * chunkX, CHUNK_SIZE * chunkY);
				
				TPChunk *chunk = [[TPChunk alloc] initWithLocation:chunkPoint mapSize:MAP_SIZE withSeed:1];
				chunk.size = CHUNK_SIZE;
				[self.chunks addObject:chunk];
				
			}
		}
		
	}
	
	return self;
}

- (NSBitmapImageRep *)sineWave {
	if (!_sineWave) {
		NSImage *sineImage = [[NSImage alloc] initWithSize:NSMakeSize(MAP_SIZE, MAP_SIZE)];
		
		[sineImage lockFocus];
		
		[[NSColor blackColor] set];
		NSRectFill(NSMakeRect(0, 0, sineImage.size.width, sineImage.size.height));
		
		[sineImage unlockFocus];
		
		_sineWave = [NSBitmapImageRep imageRepWithData:sineImage.TIFFRepresentation];
		
		for (int x = 0; x < MAP_SIZE; x++) {
			for (int y = 0; y < MAP_SIZE; y++) {
				
				float xVal = sinf((x * ((MAP_SIZE / 2) * 0.0001)));
				float yVal = sinf((y * ((MAP_SIZE / 2) * 0.0001)));
				
				float heightVal = xVal * yVal;
				
				NSColor *heightColor = [NSColor colorWithCalibratedRed:heightVal green:heightVal blue:heightVal alpha:1.0];
				
				[_sineWave setColor:heightColor atX:x y:y];
				
			}
		}
		
		NSImage *image = [[NSImage alloc] initWithData:_sineWave.TIFFRepresentation];
		[image saveImageToPath:[@"~/Desktop/sine.tiff" stringByExpandingTildeInPath]];
	}
	
	return _sineWave;
}

- (NSBitmapImageRep *)noiseMap {
	
	if (!_noiseMap) {
		/*
		 NSImage *noiseImage = [[NSImage alloc] initWithSize:NSMakeSize(MAP_SIZE - CIIMAGE_BLUR_CORRECTION, MAP_SIZE - CIIMAGE_BLUR_CORRECTION)];
		 
		 [noiseImage lockFocus];
		 
		 [[NSColor blackColor] set];
		 NSRectFill(NSMakeRect(0, 0, noiseImage.size.width, noiseImage.size.height));
		 
		 [noiseImage unlockFocus];
		 
		 _noiseMap = [NSBitmapImageRep imageRepWithData:noiseImage.TIFFRepresentation];
		 
		 for (int x = 0; x < noiseImage.size.width; x++) {
		 for (int y = 0; y < noiseImage.size.height; y++) {
		 float rVal = (random() % 256);
		 
		 rVal = rVal / 256;
		 
		 [_noiseMap setColor:[NSColor colorWithCalibratedRed:rVal green:rVal blue:rVal alpha:1.0] atX:x y:y];
		 
		 }
		 }
		 
		 CIImage *inputImage = [CIImage imageWithData:_noiseMap.TIFFRepresentation];
		 CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
		 [filter setDefaults];
		 [filter setValue:[NSNumber numberWithInt:BLUR_RADIUS] forKey:@"inputRadius"];
		 [filter setValue:inputImage forKey:@"inputImage"];
		 CIImage *outputImage = [filter valueForKey:@"outputImage"];
		 
		 NSRect outputImageRect = NSRectFromCGRect(outputImage.extent);
		 NSImage *blurredImage = [[NSImage alloc] initWithSize:outputImageRect.size];
		 
		 [blurredImage lockFocus];
		 
		 [outputImage drawAtPoint:NSZeroPoint fromRect:outputImageRect operation:NSCompositeCopy fraction:1.0];
		 
		 [blurredImage unlockFocus];
		 
		 _noiseMap = [[NSBitmapImageRep alloc] initWithData:blurredImage.TIFFRepresentation];
		 
		 NSImage *image = [[NSImage alloc] initWithData:_noiseMap.TIFFRepresentation];
		 [image saveImageToPath:[@"~/Desktop/noise.tiff" stringByExpandingTildeInPath]];
		 */
		
	}
	
	return _noiseMap;
	
}

- (void)drawFromPoint:(NSPoint)point {
	
	for (TPChunk *chunk in self.chunks) {
		
		float distance = DistanceToPoint(point, chunk.center);
		
		if (distance <= VIEW_RANGE) {
			[chunk draw];
		}
		
	}
}

@end
