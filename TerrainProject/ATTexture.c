//
//  ATTexture.c
//  TerrainProject
//
//  Created by Jeremy School on 5/4/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>
#include "ATTexture.h"

// Here we get in raw texture data, do all the OpenGL stuff needed to create a texture and stuff the size and position and id into an ATTexture for safekeeping.
ATTexture at_create_texture(GLubyte *texture_data, int format, ATPoint origin, ATSize size, bool alpha) {
	
	if (texture_data == 0) {
		ATTexture texture = {0, ATOriginPoint, ATZeroSize, false};
		return texture;
	}
	
	GLuint textureID; // Create a place to store the texture ID
	
	glGenTextures(1, &textureID); // Generate the ID
	glBindTexture(GL_TEXTURE_2D, textureID); // This is now the active texture ID
	
	glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	
	// Actually creates the OpenGL texture
	glTexImage2D(GL_TEXTURE_2D, 0, format, size.width, size.height, 0, format, GL_UNSIGNED_BYTE, texture_data);
	
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	
	ATTexture texture = {textureID, origin, size, alpha};
	return texture;
}

void at_destroy_texture(ATTexture texture) {
	glDeleteTextures(1, &texture.id);
}

void at_print_texture(ATTexture texture) {
	printf("ID: %d Origin: (%f, %f) Size: (W: %f H: %f)\n", texture.id, texture.origin.x, texture.origin.y, texture.size.width, texture.size.height);
}