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

@interface TPString : NSObject {
	
}

@property (nonatomic, strong) NSString *string;
@property (nonatomic, readonly) ATTexture texture;
@property (nonatomic, strong) NSDictionary *attributes;

- (id)initWithString:(NSString *)string;

- (void)drawInGLViewAtPoint:(NSPoint)point;

void drawStringAtPoint(NSString *string, NSColor *color, NSPoint point);

@end
