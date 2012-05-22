//
//  TPTerrainGenerator.m
//  TerrainProject
//
//  Created by Jeremy School on 5/19/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPTerrainGenerator.h"
#import <QuartzCore/QuartzCore.h>

@implementation TPTerrainGenerator
@synthesize seed = _seed;
@synthesize size = _size;

- (id)initWithSeed:(int)seed mapSize:(int)mapSize {
	self = [super init];
	if (self) {
		self.seed = seed;
		self.size = NSMakeSize(mapSize, mapSize);
	}
	
	return self;
}

- (float)heightOfPoint:(NSPoint)point {
	
	float total = getHeightAtPoint(point, 0.01, HILLINESS, self.size.height, self.seed);
	
	float detailTotal = getHeightAtPoint(point, 0.2, ROCKINESS, self.size.height, self.seed);
	/*
	if (point.x == 25 && point.y == 25) {
		NSLog(@"%f", total + detailTotal);
		NSLog(@"%f", (total * HILLINESS) + (detailTotal * ROCKINESS));
	}
	*/
	return total + detailTotal;
	
}

// My understanding of the code is rather sketchy after this point

float getHeightAtPoint(NSPoint point, float frequency, float amplitude, float height, float seed) {
	return (smoothedNoise(point.x * frequency, point.y * frequency, height, seed)) * amplitude;
}

float smoothedNoise(float x, float y, float height, int seed) {
	int intX = (int)x;
	int intY = (int)y;
	
	float remX = x - (float)intX;
	float remY = y - (float)intY;
	
	float v1, v2, v3, v4, t1, t2;
	
	//cosine interpolation
	v1 = randomFloat(intX, intY, height, seed);
	v2 = randomFloat(intX + 1, intY, height, seed);
	v3 = randomFloat(intX, intY + 1, height, seed);
	v4 = randomFloat(intX + 1, intY + 1, height, seed);
	
	t1 = cosine(v1, v2, remX);
	t2 = cosine(v3, v4, remX);
	
	return cosine(t1, t2, remY);
}

float randomFloat(int x, int y, float height, int seed) {
	int r;
    float s;
	
	srandom(y * height + x + seed);
	
	r = random();
	
    s = (float)(r & 0x7fff)/(float)0x7fff;
	
    return (s);
}

float cosine(float x1, float x2, float a) {
	float temp;
	temp = (1.0f - cosf(a * 3.1415927f)) / 2.0f;
	
	return (x1 * (1.0f - temp) + x2 * temp);
}
/*
- (NSBitmapImageRep *)noisemap {
	if (!_noisemap) {
		
		NSImage *noiseImage = [[NSImage alloc] initWithSize:self.size];
		
		[noiseImage lockFocus];
		
		[[NSColor blackColor] set];
		NSRectFill(NSMakeRect(0, 0, noiseImage.size.width, noiseImage.size.height));
		
		[noiseImage unlockFocus];
		
		_noisemap = [[NSBitmapImageRep alloc] initWithData:noiseImage.TIFFRepresentation];
		
		for (int x = 0; x < _noisemap.size.width; x++) {
			for (int y = 0; y < _noisemap.size.height; y++) {
				
				srandom(x * self.size.width + y);
				
				float randomVal = random() % 255;
				float randomHeight = randomVal / 255;
				
				[_noisemap setColor:[NSColor colorWithCalibratedRed:randomHeight green:randomHeight blue:randomHeight alpha:1] atX:x y:y];
			}
		}
		
		noiseImage = [[NSImage alloc] initWithData:_noisemap.TIFFRepresentation];
		
		// Blur
		CIImage *ciNoiseImage = [[CIImage alloc] initWithData:noiseImage.TIFFRepresentation];
		CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
		[filter setDefaults];
		[filter setValue:ciNoiseImage forKey:@"inputImage"];
		[filter setValue:[NSNumber numberWithInt:3] forKey:@"inputRadius"];
		CIImage *outputImage = [filter valueForKey:@"outputImage"];
		
		// Comensate for added pixels after blurring
		int xSizeDiff = outputImage.extent.size.width - noiseImage.size.width; // I don't think I actually need both the x and y differences, but just in case, it's there
		int ySizeDiff = outputImage.extent.size.height - noiseImage.size.height;
		
		NSImage *blurredNoiseImage = [[NSImage alloc] initWithSize:noiseImage.size];
		
		[blurredNoiseImage lockFocus];
		
		[outputImage drawInRect:NSMakeRect(0, 0, noiseImage.size.width, noiseImage.size.height)
					   fromRect:NSMakeRect(xSizeDiff, ySizeDiff, noiseImage.size.width - xSizeDiff, noiseImage.size.height - ySizeDiff)
					  operation:NSCompositeCopy
					   fraction:1.0];
		
		[blurredNoiseImage unlockFocus];
		
		[blurredNoiseImage saveImageToPath:[@"~/Desktop/noisyStuff.tiff" stringByExpandingTildeInPath]];
		
		_noisemap = [[NSBitmapImageRep alloc] initWithData:blurredNoiseImage.TIFFRepresentation];
	}
	
	return _noisemap;
}
*/
@end
