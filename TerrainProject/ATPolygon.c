//
//  ATPolygon.c
//  TerrainProject
//
//  Created by Jeremy School on 5/4/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>
#include "ATPolygon.h"

ATPolygon at_create_polygon(ATPoint origin, int numberOfVerts, ATPoint *points, ATColor *colors) {
	ATPolygon polygon = {origin, numberOfVerts, points, colors};
	return polygon;
}

void at_draw_polygon(ATPolygon polygon, int drawMode) {
	
	glBegin(drawMode);
	
	for (int i = 0; i < polygon.num_vertices; i++) {
		
		glColor3f(polygon.colors[i].r, polygon.colors[i].g, polygon.colors[i].b);
		glVertex2f(polygon.points[i].x, polygon.points[i].y);
		
	}
	
	glEnd();

}

void at_print_polygon(ATPolygon polygon, bool printPoints) {
	printf("Origin: (X: %f Y: %f)", polygon.origin.x, polygon.origin.y);
	
	if (printPoints == true) {
		printf(" Vertices: (\n\n");
		
		for (int i = 0; i < polygon.num_vertices; i++) {
			printf("X: %f Y: %f\n", polygon.points[i].x, polygon.points[i].y);
		}
		
		printf("\n)\n");
	} else {
		printf("\n");
	}
	
}