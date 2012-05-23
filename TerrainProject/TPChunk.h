//
//  TPChunk.h
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSVertex.h"
#import "TPTerrainGenerator.h"
#import "NSArray+TwoD.h"

#define DRAW_LINE NO

#define LIGHTNING_SOFTNESS 1

#define MAX_LIGHT 0.9
#define MIN_LIGHT 0.01

// degrees
#define MAX_GRASS_SLOPE 0.5
#define MAX_DIRT_SLOPE 0.8
#define MAX_ROCK_SLOPE 5.0

// meters
#define WATER_LEVEL 300
#define SNOW_LEVEL 500

@interface TPChunk : NSObject {
	@private
	float _privateSize;
}

@property (nonatomic, readwrite) NSPoint location; // The location of this chunk
@property (nonatomic, readwrite) float size; // The length of a side of this chunk
@property (nonatomic, readwrite) float mapSize;
@property (nonatomic, strong) TPTerrainGenerator *generator;
@property (nonatomic, readwrite) int seed;
@property (nonatomic, strong) NSArray *points;
@property (nonatomic, readonly) NSPoint center;

- (id)initWithLocation:(NSPoint)location mapSize:(int)mapSize withSeed:(int)seed;
- (void)draw;

int compare_elements(const void *a, const void *b);

@end
