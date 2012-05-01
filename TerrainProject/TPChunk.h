//
//  TPChunk.h
//  TerrainProject
//
//  Created by Jeremy School on 4/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPChunk : NSObject

@property (nonatomic, readwrite) NSPoint location; // The location of this chunk
@property (nonatomic, weak) NSBitmapImageRep *heightmap;
@property (nonatomic, strong) NSArray *points;

@end
