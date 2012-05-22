//
//  TPTerrain.h
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSVertex.h"
#import "NSArray+TwoD.h"
#import "TPChunk.h"
#import "Atmosphere.h"
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

// In meters
#define MAP_SIZE 10000
#define CHUNK_SIZE 25
#define VIEW_RANGE 150

#define Square(num) ((num) * (num))
#define DistanceToPoint(startPoint, endPoint) (sqrtf(Square(startPoint.x - endPoint.x) + Square(startPoint.y - endPoint.y)))

@interface TPTerrain : NSObject

@property (atomic, strong) NSArray *chunks;

- (id)init;

- (void)drawFromPoint:(NSPoint)point;

@end