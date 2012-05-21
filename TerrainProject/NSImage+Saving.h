//
//  NSImage+Saving.h
//  TerrainProject
//
//  Created by Jeremy School on 5/9/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Handy little category which lets save an NSImage as a TIFF file. Can be accomplished without too much effort without this category, but it's a tad easier to remember - (void)saveImageToPath: than the alternative.
@interface NSImage (Saving)

- (void)saveImageToPath:(NSString *)path;

@end
