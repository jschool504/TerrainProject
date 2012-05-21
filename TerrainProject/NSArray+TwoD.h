//
//  NSArray+TwoD.h
//  TerrainProject
//
//  Created by Jeremy School on 5/16/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TwoD)

- (id)objectAtIndices:(NSUInteger)x y:(NSUInteger)y sideLength:(NSUInteger)l;

@end