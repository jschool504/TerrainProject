//
//  TPAxis.h
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGL/gl.h>
#import <OpenGL/glu.h>

#define TPAxisTypeX 0
#define TPAxisTypeY 1
#define TPAxisTypeZ 2

@interface TPAxis : NSObject {
	
}

@property (nonatomic, readwrite) int type;
@property (nonatomic, readwrite) float length;

- (id)initWithAxisType:(int)axisType axisLength:(float)length;

- (void)draw;

@end
