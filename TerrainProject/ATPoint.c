//
//  ATPoint.c
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

#include "ATPoint.h"

// Creating

ATPoint at_create_point(float x, float y) {
	ATPoint point = {x, y};
	return point;
}

// Drawing

void at_draw_point(ATPoint point, int drawMode) {
	
	glBegin(drawMode);
	
	glVertex2f(point.x, point.y);
	
	glEnd();
	
}

// Debugging

char * at_string_point(ATPoint point) {
	char * output = malloc(sizeof(char) * 33);
	sprintf(output, "Point: (X: %f Y: %f)", point.x, point.y);
	return output;
}

void at_print_point(ATPoint point) {
	printf("%s\n", at_string_point(point));
}