//
//  AtmosphereDebug.c
//  TerrainProject
//
//  Created by Jeremy School on 4/30/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>

#include "ATTypes.h"

void print_state(ATUIState uistate) {
	
	printf("Hot ID: %d, Active ID: %d\n Mouse Location: %f, %f\n Mouse Down: %d\n\n", uistate.hotId, uistate.activeId, uistate.mousePoint.x, uistate.mousePoint.y, uistate.mouseDown);
	
}

void print_point(ATPoint point) {
	
	printf("X: %f, Y: %f\n", point.x, point.y);
	
}

void print_size(ATSize size) {
	
	printf("Width: %f, Height: %f", size.width, size.height);
	
}

void print_rect(ATRect rect) {
	
	printf("Origin: (%f, %f) Size: (%f, %f)\n", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
	
}

// Note to self: could be some fun natural language stuff that I could do here. Maybe if I'm bored some day :-)

void print_color(ATColor color) {
	
	printf("Red: %f, Green: %f, Blue: %f\n", color.r, color.g, color.b);
	
}