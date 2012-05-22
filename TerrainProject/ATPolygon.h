//
//  ATPolygon.h
//  TerrainProject
//
//  Created by Jeremy School on 5/4/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include "ATPoint.h"
#include "ATColor.h"

#ifndef TerrainProject_ATPolygon_h
#define  TerrainProject_ATPolygon_h

// Dynamic shape. ATPolygons can hold an array of vertices and draw them
typedef struct {
	
	ATPoint origin;
	int num_vertices; // Number of verts in the array
	
	ATPoint *points; // Array of vertices. Be careful of the order in which you put them in, because that's the order they'll be drawn in
	ATColor *colors; // You'll need to match up each color with each vertex (i.e., color1 is at the same index vertex2 is at)
	
} ATPolygon;

#endif

ATPolygon at_create_polygon(ATPoint origin, int numberOfVerts, ATPoint *points, ATColor *colors);
ATPolygon at_create_polygon_onv(ATPoint origin, int numberOfVerts, ATPoint *points);
ATPolygon at_create_polygon_o(ATPoint origin);

void at_draw_polygon(ATPolygon polygon, int drawMode);

void at_print_polygon(ATPolygon polygon, bool printPoints);