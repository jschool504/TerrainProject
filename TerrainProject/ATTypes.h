//
//  ATTypes.h
//  TerrainProject
//
//  Created by Jeremy School on 4/30/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

// Geometric structs

typedef struct _ATSize {
	
	float width;
	float height;
	
} ATSize;

typedef struct _ATPoint {
	
	float x;
	float y;
	
} ATPoint;

typedef struct _ATRect {
	
	ATPoint origin;
	ATSize size;
	
} ATRect;

typedef struct _ATColor {
	
	float r;
	float g;
	float b;
	
} ATColor;

// Some default structs
#define ATZeroSize ATMakeSize(0, 0)
#define ATZeroPoint ATMakePoint(0, 0)
#define ATZeroRect ATMakeRect(ATZeroPoint, ATZeroSize)

#define ATBlackColor ATMakeColor(0, 0, 0)
#define ATWhiteColor ATMakeColor(1, 1, 1)
#define ATGrayColor ATMakeColor(0.5, 0.5, 0.5);
#define ATRedColor ATMakeColor(1, 0, 0)
#define ATGreenColor ATMakeColor(0, 1, 0)
#define ATBlueColor ATMakeColor(0, 0, 1)

// UI state struct

typedef struct _ATUIState {
	
	ATPoint mousePoint;
	int mouseDown;
	
	int hotId; // Hover
	int activeId; // Pushed
	
} ATUIState;

// Type Contructors
ATPoint ATMakePoint(float x, float y);
ATSize ATMakeSize(float width, float height);
ATRect ATMakeRect(ATPoint origin, ATSize size);
ATColor ATMakeColor(float red, float green, float blue);