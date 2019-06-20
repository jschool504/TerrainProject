//
//  ATColor.h
//  TerrainProject
//
//  Created by Jeremy School on 5/4/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#define ATBlackColor	at_create_color(0, 0, 0)
#define ATGrayColor		at_create_color(0.5, 0.5, 0.5)
#define ATWhiteColor	at_create_color(1, 1, 1)
#define ATRedColor		at_create_color(1, 0, 0)
#define ATGreenColor	at_create_color(0, 1, 0)
#define ATBlueColor		at_create_color(0, 0, 1)

#ifndef TerrainProject_ATColor_h
#define TerrainProject_ATColor_h

// This is an ATColor, which stores rgb colors like this: {0.67, 0.5, 0.1}. It's easy to plugin into the glColor3f() command that way. There is no 3D version :-)
typedef struct {
	
	float r;
	float g;
	float b;
	
	float a;
	
} ATColor;

#endif

ATColor at_create_color(float red, float green, float blue, float alpha);

char * at_string_color(ATColor color);

void at_print_color(ATColor color);