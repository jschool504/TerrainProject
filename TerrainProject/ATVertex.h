//
//  ATVertex.h
//  TerrainProject
//
//  Created by Jeremy School on 5/4/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include "ATColor.h"

#define ATOriginVertex at_create_vertex(0, 0, 0)

#ifndef TerrainProject_ATVertex_h
#define TerrainProject_ATVertex_h

// This is the 3D equivalent of an ATPoint. Note the name difference.
typedef struct ATVertex {
	
	float x;
	float y;
	float z;
	
} ATVertex;

#endif

ATVertex at_create_vertex(float x, float y, float z);
void at_draw_vertex(ATVertex vertex, int drawMode);
void at_draw_colored_vertex(ATVertex vertex, ATColor color, int drawMode);
char * at_string_vertex(ATVertex vertex);
void at_print_vertex(ATVertex vertex);