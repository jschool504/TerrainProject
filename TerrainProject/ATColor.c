//
//  ATColor.c
//  TerrainProject
//
//  Created by Jeremy School on 5/4/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "ATColor.h"

ATColor at_create_color(float red, float green, float blue, float alpha) {
	ATColor color = {red, green, blue, alpha};
	return color;
}

char * at_string_color(ATColor color) {
	char *output = malloc(sizeof(char) * 100);
	sprintf(output, "Color: (R: %f G: %f B: %f A: %f)", color.r, color.g, color.b, color.a);
	return output;
}

void at_print_color(ATColor color) {
	printf("%s\n", at_string_color(color));
}