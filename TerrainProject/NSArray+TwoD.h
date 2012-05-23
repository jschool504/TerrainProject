//
//  NSArray+TwoD.h
//  TerrainProject
//
//  Created by Jeremy School on 5/16/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

// This category let's me easily treat an NSArray as though it were two dimensional. Note: find out if I'm actually using this anywhere.
@interface NSArray (TwoD)

- (id)objectAtIndices:(NSUInteger)x y:(NSUInteger)y sideLength:(NSUInteger)l;

@end

@interface NSMutableArray (TwoD)

- (id)objectAtIndices:(NSUInteger)x y:(NSUInteger)y sideLength:(NSUInteger)l;

@end