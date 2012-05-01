//
//  TPShapeProtocol.h
//  TerrainProject
//
//  Created by Jeremy School on 4/25/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TPShapeProtocol <NSObject>

@required
- (void)draw; //draws the desired shape using OpenGL

@optional
- (void)print; //prints information about the shape, such as it's location and vertices

@end
