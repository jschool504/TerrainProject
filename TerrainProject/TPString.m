//
//  TPString.m
//  TerrainProject
//
//  Created by Jeremy School on 5/10/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "TPString.h"
#import "NSImage+OpenGLTexture.h"
#import "NSImage+Saving.h"

@implementation TPString
@synthesize string = _string, texture = _texture, attributes = _attributes;

- (id)initWithString:(NSString *)string {
	self = [super init];
	if (self) {
		self.string = string;
	}
	
	return self;
}

- (void)drawInGLViewAtPoint:(NSPoint)point {
	
	ATPoint *points = malloc(sizeof(ATPoint) * 4);
	points[0] = at_create_point(point.x, point.y);
	points[1] = at_create_point(point.x, point.y + self.size.height);
	points[2] = at_create_point(point.x + self.size.width, point.y);
	points[3] = at_create_point(point.x + self.size.width, point.y + self.size.height);
	
	ATPoint *texturePoints = malloc(sizeof(ATPoint) * 4);
	texturePoints[0] = at_create_point(0, 0);
	texturePoints[1] = at_create_point(0, self.size.height / self.texture.size.height);
	texturePoints[2] = at_create_point(self.size.width / self.texture.size.width, 0);
	texturePoints[3] = at_create_point(self.size.width / self.texture.size.width, self.size.height / self.texture.size.height);
	
	ATTexturedPolygon polygon = at_create_textured_polygon(ATOriginPoint, 4, points, self.texture, texturePoints);
	
	at_draw_textured_polygon(polygon, GL_TRIANGLE_STRIP);
	
	at_destroy_texture(self.texture);
}

void drawStringAtPoint(NSString *string, NSColor *color, NSPoint point) {
	
	if (color == nil) {
		color = [NSColor whiteColor];
	}
	
	TPString *stringToDraw = [[TPString alloc] initWithString:string];
	stringToDraw.attributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSFont fontWithName:@"Menlo" size:12], color, nil]
														  forKeys:[NSArray arrayWithObjects:NSFontAttributeName, NSForegroundColorAttributeName, nil]];
	[stringToDraw drawInGLViewAtPoint:point];
}

- (ATTexture)texture {
	
	if (_texture.id == 0) {		
		CGSize cgStringSize = [self.string sizeWithAttributes:self.attributes];
		
		ATSize atStringSize = at_create_size(cgStringSize.width, cgStringSize.height);
		atStringSize = at_convert_to_po2(atStringSize);
		
		CGSize newCGStringSize = CGSizeMake(atStringSize.width, atStringSize.height);
		
		NSImage *image = [[NSImage alloc] initWithSize:newCGStringSize];
		
		[image lockFocus];
		[self.string drawAtPoint:NSZeroPoint withAttributes:self.attributes];
		[image unlockFocus];
		
		_texture = at_create_texture(image.glubyteValue,
									 GL_RGBA,
									 ATOriginPoint,
									 at_create_size(image.size.width, image.size.height),
									 YES);
	}
	
	return _texture;
}

- (NSDictionary *)attributes {
	if (!_attributes) {
		_attributes = [NSDictionary dictionary];
	}
	
	return _attributes;
}

- (NSSize)size {
	return [self.string sizeWithAttributes:self.attributes];
}

@end
