//
//  ATVertex.c
//  TerrainProject
//
//  Created by Jeremy School on 5/4/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

#include "ATVertex.h"

ATVertex at_create_vertex(float x, float y, float z) {
	ATVertex vertex = {x, y, z};
	return vertex;
}

void at_draw_vertex(ATVertex vertex, int drawMode) {
	
	glBegin(drawMode);
	
	glVertex3f(vertex.x, vertex.y, vertex.z);
	
	glEnd();
	
}

void at_draw_colored_vertex(ATVertex vertex, ATColor color, int drawMode) {
	
	glBegin(drawMode);
	
	glColor3f(color.r, color.g, color.b);
	
	glVertex3f(vertex.x, vertex.y, vertex.z);
	
	glEnd();
	
}

char * at_string_vertex(ATVertex vertex) {
	char *output = malloc(sizeof(char) * 100);
	sprintf(output, "Vertex: (X: %f Y: %f Z: %f)", vertex.x, vertex.y, vertex.z);
	return output;
}

void at_print_vertex(ATVertex vertex) {
	printf("%s\n", at_string_vertex(vertex));
}