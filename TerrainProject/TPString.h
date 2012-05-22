//
//  TPString.h
//  TerrainProject
//
//  Created by Jeremy School on 5/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Atmosphere.h"

#define FONT_SIZE 12

// Here is where the text you see overlaying the window is drawn. I REALLY want to expand this; I'm thinking an NSDictionary system where you can register NSString's with a TPConsole singleton object, then make changes to those strings at any point in the code. It could basically take the place of NSLog, which would be great, as NSLog is *really* slow.

@interface TPString : NSObject {
	
}

@property (nonatomic, strong) NSString *string;
@property (nonatomic, readonly) ATTexture texture;
@property (nonatomic, strong) NSDictionary *attributes;

- (id)initWithString:(NSString *)string;

- (void)drawInGLViewAtPoint:(NSPoint)point;

void drawStringAtPoint(NSString *string, NSColor *color, NSPoint point);

@end
