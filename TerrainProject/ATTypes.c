//
//  ATTypes.c
//  TerrainProject
//
//  Created by Jeremy School on 4/30/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>
#include "ATTypes.h"

ATPoint ATMakePoint(float x, float y) {
	ATPoint point = {x, y};
	return point;
}

ATSize ATMakeSize(float width, float height) {
	ATSize size = {width, height};
	return size;
}

ATRect ATMakeRect(ATPoint origin, ATSize size) {
	ATRect rect = {origin, size};
	return rect;
}

ATColor ATMakeColor(float red, float green, float blue) {
	ATColor color = {red, green, blue};
	return color;
}