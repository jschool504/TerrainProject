//
//  ATTexture.h
//  TerrainProject
//
//  Created by Jeremy School on 5/4/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdbool.h>
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

#include "ATPoint.h"
#include "ATSize.h"
#include "ATImage.h"

#ifndef TerrainProject_ATTexture_h
#define TerrainProject_ATTexture_h

typedef struct {
	
	int id; // OpenGL will store all the texture pixels and stuff. All we need is a number referencing the texture.
	
	ATPoint origin;
	ATSize size;
	
	bool alpha;
	
} ATTexture;

#endif

ATTexture at_create_texture(unsigned char *texture_data, int format, ATPoint origin, ATSize size, bool alpha);
void at_destroy_texture(ATTexture texture);
void at_print_texture(ATTexture texture);