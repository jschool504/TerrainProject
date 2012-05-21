//
//  TPTerrain.h
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSVertex.h"
#import "NSImage+Saving.h"
#import "NSArray+TwoD.h"
#import "TPChunk.h"
#import "Atmosphere.h"
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

#define MAP_SIZE 16384
#define CHUNK_SIZE 32
#define VIEW_RANGE 128
#define CIIMAGE_BLUR_CORRECTION 14 // I have to use this because the image is made 14 pixels larger when it's blurred. Stupid Core Image.
#define Square(num) ((num) * (num))
#define DistanceToPoint(startPoint, endPoint) (sqrtf(Square(startPoint.x - endPoint.x) + Square(startPoint.y - endPoint.y)))

@interface TPTerrain : NSObject

@property (nonatomic, strong) NSBitmapImageRep *sineWave;
@property (nonatomic, strong) NSBitmapImageRep *noiseMap;
@property (nonatomic, strong) NSBitmapImageRep *heightmap;
@property (nonatomic, strong) NSArray *points;
@property (nonatomic, strong) NSMutableArray *chunks;

- (id)initWithHeightmap:(NSString *)mapPath;

- (void)drawFromPoint:(NSPoint)point;

@end
