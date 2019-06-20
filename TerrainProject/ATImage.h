//
//  ATImage.h
//  TerrainProject
//
//  Created by Jeremy School on 5/24/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include "ATSize.h"
#include "ATColor.h"

#ifndef TerrainProject_ATImage_h
#define TerrainProject_ATImage_h

// Loading bitmaps

#define ATFileTypeBitmap 19778

typedef struct {
	
	short type;			// File type; is equal to 19778 if it's a btimap
	int size;			// Total size of file, including headers
	short reserved_1;	// Should have nothing but zeros
	short reserved_2;	// Should have nothing but zeros
	int off_bits;		// offset from beginning of file to actual image data
	
} _AT_BITMAP_FILE_HEADER; // I use an underscore and ALL CAPS LETTERS to denote "private" types. These aren't really meant for public use, they're just used for loading the bitmap.

typedef struct {
	
	int size;				// Size of the file header (should be 40)
	long width;				// width of the image
	long height;			// height of the image
	short planes;			// number of bit planes in the image (should be 1)
	short bit_count;		// number of bits per pixel (1, 4, 8, or 24)
	int compression;		// compression, if any. 0 if no compression
	int size_image;			// should be size of image data. Sometimes 0 :-)
	long x_pels_per_meter;	// number of pixels per meter
	long y_pels_per_meter;
	int clr_used;			// number of colors from color pallette used. if image is 24-bit, usually 0
	int clr_important;		// number of color indexes that are important. if 0, all indexes are important
	
} _AT_BITMAP_INFO_HEADER;

typedef struct {
	
	unsigned char *data;
	ATSize size;
	int bit_count;
	
} ATBitmap;

#endif

ATBitmap at_create_bitmap(unsigned char *data, ATSize size, int bit_count);
ATColor at_color_for_position(ATBitmap bitmap, int x, int y);
ATBitmap at_load_bitmap(char *file_path);