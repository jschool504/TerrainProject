//
//  NSImage+Saving.m
//  TerrainProject
//
//  Created by Jeremy School on 5/9/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "NSImage+Saving.h"

@implementation NSImage (Saving)

- (void)saveImageToPath:(NSString *)path {
	[self.TIFFRepresentation writeToFile:path atomically:NO];
}

@end
