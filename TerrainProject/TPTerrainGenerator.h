//
//  TPTerrainGenerator.h
//  TerrainProject
//
//  Created by Jeremy School on 5/19/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ROCKINESS 1 // Will be determined per region eventually
#define HILLINESS 300 // Will be determined per region eventually

@interface TPTerrainGenerator : NSObject {
	float min;
}

@property (nonatomic, readwrite) NSSize size;
@property (nonatomic, readwrite) int seed;

- (id)initWithSeed:(int)seed mapSize:(int)mapSize;

- (float)heightOfPoint:(NSPoint)point;

float getHeightAtPoint(NSPoint point, float frequency, float amplitude, float height, float seed);
float smoothedNoise(float x, float y, float height, int seed);
float randomFloat(int x, int y, float height, int seed);
float cosine(float x1, float x2, float a);

@end
