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

#define DRAW_LINE YES

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

@end
