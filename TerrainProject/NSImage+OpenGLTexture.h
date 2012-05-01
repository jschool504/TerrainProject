//
//  NSImage+OpenGLTexture.h
//  TerrainProject
//
//  Created by Jeremy School on 4/27/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

@interface NSImage(OpenGLTexture)

- (GLuint)openGLTextureID;

@end
