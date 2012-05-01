//
//  Atmosphere.c
//  TerrainProject
//
//  Created by Jeremy School on 4/30/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

#include "Atmosphere.h"
#include <OpenGL/OpenGL.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl.h>

bool point_in_rect(ATRect region, ATUIState *uistate) {
	
	//printf("origin: %f, %f | size: %f, %f\n", region.origin.x, region.origin.y, region.size.width, region.size.height);
	//printf("mousePoint: %f, %f", uistate->mousePoint->x, uistate->mousePoint->y);
	
	if (uistate->mousePoint.x < region.origin.x ||
		uistate->mousePoint.y < region.origin.y ||
		uistate->mousePoint.x >= region.origin.x + region.size.width ||
		uistate->mousePoint.y >= region.origin.y + region.size.height) {
		
		return false;
	}
	
	return true;
}

void atmosphere_init(ATUIState *uistate) {
	uistate->hotId = 0;
	uistate->activeId = 0;
	uistate->mouseDown = false;
	ATPoint point = ATMakePoint(-1, -1);
	uistate->mousePoint = point;
}

void atmosphere_start(ATUIState *uistate) {
	uistate->hotId = 0;
	printf("%f, %f\n", uistate->mousePoint.x, uistate->mousePoint.y);
}

void atmosphere_finish(ATUIState *uistate) {
	if (uistate->mouseDown == false) {
		uistate->activeId = 0;
	} else {
		if (uistate->activeId == 0) {
			uistate->activeId = -1;
		}
	}
}

void draw_rect(ATRect rect, ATColor rectColor) {
	
	glPushMatrix();
	
	glTranslatef(rect.origin.x, rect.origin.y, 0);
	
	glBegin(GL_TRIANGLE_STRIP);
	
	glColor3f(rectColor.r, rectColor.g, rectColor.b);
	
	glVertex3f(0, 0, 0);
	glVertex3f(0, rect.size.height, 0);
	glVertex3f(rect.size.width, 0, 0);
	glVertex3f(rect.size.width, rect.size.height, 0);
	
	glEnd();
	
	glPopMatrix();
	
}

// Button

#define ButtonColorRegular {0.5, 0.5, 0.0}
#define ButtonColorPressed {0.3, 0.3, 0.0}

int do_button(int id, ATRect buttonRect, ATUIState *uistate) {
	if (point_in_rect(buttonRect, uistate)) {
		uistate->hotId = id;
		if (uistate->activeId == 0 && uistate->mouseDown == true) {
			uistate->activeId = id;
		}
	}
	
	if (uistate->activeId == id) {
		ATColor buttonColor = ButtonColorPressed;
		draw_rect(buttonRect, buttonColor);
	} else {
		ATColor buttonColor = ButtonColorRegular;
		draw_rect(buttonRect, buttonColor);
	}
	
	if (uistate->mouseDown == false && uistate->hotId == id && uistate->activeId == id) {
		return true;
	}
	
	return false;
}

