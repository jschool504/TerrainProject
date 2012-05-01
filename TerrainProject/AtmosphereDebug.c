//
//  AtmosphereDebug.c
//  TerrainProject
//
//  Created by Jeremy School on 4/30/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>

#include "ATTypes.h"

void print_state(ATUIState *uistate) {
	
	printf("Hot ID: %d, Active ID: %d\n Mouse Location: %f, %f\n Mouse Down: %d\n\n", uistate->hotId, uistate->activeId, uistate->mousePoint.x, uistate->mousePoint.y, uistate->mouseDown);
	
}