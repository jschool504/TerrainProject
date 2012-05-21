//
//  NSArray+TwoD.m
//  TerrainProject
//
//  Created by Jeremy School on 5/16/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "NSArray+TwoD.h"

@implementation NSArray (TwoD)

- (id)objectAtIndices:(NSUInteger)x y:(NSUInteger)y sideLength:(NSUInteger)l {
	
	return [self objectAtIndex:x + (y * l)];
	
}

@end
