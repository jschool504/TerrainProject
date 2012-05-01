//
//  Atmosphere.h
//  TerrainProject
//
//  Created by Jeremy School on 4/30/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#ifndef TerrainProject_Atmosphere_h
#define TerrainProject_Atmosphere_h

#include "ATTypes.h"

// ID Generators
#ifdef ATMOSPHERE_SRC_ID
#define AT_GEN_ID ((ATMOSPHERE_SRC_ID) + (__LINE__))
#else
#define AT_GEN_ID (__LINE__)
#endif

// Lifecycle Functions
void atmosphere_init(ATUIState *uistate);
void atmosphere_start(ATUIState *uistate);
void atmosphere_finish(ATUIState *uistate);

// Utility Functions
bool point_in_rect(ATRect region, ATUIState *uistate);
void draw_rect(ATRect rect, ATColor rectColor);

// Widgets
int do_button(int id, ATRect buttonRect, ATUIState *uistate);

// Debugging Functions
void print_state(ATUIState uistate);
void print_point(ATPoint point);
void print_size(ATSize size);
void print_rect(ATRect rect);
void print_color(ATColor color);

#endif
