//
//  NSImage+OpenGLTexture.m
//  TerrainProject
//
//  Created by Jeremy School on 4/27/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "NSImage+OpenGLTexture.h"

@implementation NSImage (OpenGLTexture)

- (GLuint)openGLTextureID {
	
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
	
	GLubyte *sourcePic;
	GLenum imageFormat = GL_RGBA;
	long sourceRowBytes, pixelSize;
	
	if (bitmap.hasAlpha == YES) {
		pixelSize = 4;
	} else {
		imageFormat = GL_RGB;
		pixelSize = 3;
	}
	
	NSSize imageSize = bitmap.size;
	sourceRowBytes = bitmap.bytesPerRow;
	
	sourcePic = (GLubyte *)bitmap.bitmapData;
	
	GLubyte *pic = malloc(imageSize.height * sourceRowBytes);
	GLuint i;
	for (i = 0; i < imageSize.height; i++) {
		memcpy(pic + (i * sourceRowBytes), sourcePic + (((int)imageSize.height - 1) * sourceRowBytes), sourceRowBytes);
	}
	
	sourcePic = pic;
	
	//OpenGL
	
	GLuint textureID;
	
	glEnable(GL_TEXTURE_2D);
	glEnable(GL_COLOR_MATERIAL);
	
	glGenTextures(1, &textureID);
	glBindTexture(GL_TEXTURE_2D, textureID);
	
	glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
	
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_BORDER, 0);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	
	glTexImage2D(GL_TEXTURE_2D, 0, imageFormat, rect.size.width, rect.size.height, 0, imageFormat, GL_UNSIGNED_BYTE, sourcePic);
	
	glDisable(GL_TEXTURE_2D);
	glDisable(GL_COLOR_MATERIAL);
	
	return textureID;
}

@end
