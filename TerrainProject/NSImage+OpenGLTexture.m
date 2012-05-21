//
//  NSImage+OpenGLTexture.m
//  TerrainProject
//
//  Created by Jeremy School on 4/27/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "NSImage+OpenGLTexture.h"

@implementation NSImage (OpenGLTexture)

- (GLubyte *)glubyteValue {
	
	NSImage *image = [[NSImage alloc] initWithSize:self.size];
	NSRect rect = NSZeroRect;
	rect.size = self.size;
	
	[image lockFocus];
	NSAffineTransform *affineTransform = [NSAffineTransform transform];
	[affineTransform translateXBy:0 yBy:rect.size.height];
	[affineTransform scaleXBy:1 yBy:-1];
	[affineTransform concat];
	[self drawAtPoint:NSZeroPoint fromRect:rect operation:NSCompositeCopy fraction:1];
	[image unlockFocus];
	
	NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithData:image.TIFFRepresentation];
	
	return (GLubyte *)bitmap.bitmapData;
}

@end
