//
//  JSVertex.h
//  TerrainProject
//
//  Created by Jeremy School on 4/27/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>
#import "JSColor.h"

@interface JSVertex : NSObject

- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc;
- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc andColor:(JSColor)newColor;
- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc andNormalX:(float)normalX normalY:(float)normalY normalZ:(float)normalZ;
- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc andTextureCoordinates:(float)textureX textureCoordY:(float)textureY;
- (id)initWithLocation:(float)xLoc y:(float)yLoc z:(float)zLoc andColor:(JSColor)newColor andNormalX:(float)normalX normalY:(float)normalY normalZ:(float)normalZ andTextureCoordinates:(float)textureX textureCoordY:(float)textureY;

- (void)printLoc;
- (void)drawVertex;


//Location
@property (nonatomic, readwrite) float x;
@property (nonatomic, readwrite) float y;
@property (nonatomic, readwrite) float z;

//Normal
@property (nonatomic, readwrite) float nx;
@property (nonatomic, readwrite) float ny;
@property (nonatomic, readwrite) float nz;

//Color
@property (nonatomic, readwrite) JSColor color;

//Texture Coords
@property (nonatomic, readwrite) float tx;
@property (nonatomic, readwrite) float ty;

//Texture name
@property (nonatomic, readwrite) GLuint texId;

@end
