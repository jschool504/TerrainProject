//
//  TPTerrain.h
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSVertex.h"
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

@interface TPTerrain : NSObject

@property (nonatomic, strong) NSBitmapImageRep *heightmap;
@property (nonatomic, strong) NSArray *points;
@property (nonatomic, readwrite) int colorChannel;

- (id)initWithHeightmap:(NSString *)mapPath;

- (void)drawFromPoint:(NSPoint)point;

- (void)rebuildTerrain;

@end
