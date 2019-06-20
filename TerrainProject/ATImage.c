//
//  ATImage.c
//  TerrainProject
//
//  Created by Jeremy School on 5/24/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "ATImage.h"

ATBitmap at_create_bitmap(unsigned char *data, ATSize size, int bit_count) {
	data = malloc((size.width * bit_count + 7) / 8 * size.height);
	ATBitmap bitmap = {data, size, bit_count};
	return bitmap;
}

ATBitmap at_load_bitmap(char *file_path) {
	
	FILE *file;
	ATBitmap bitmap = {0, 0, 0};
	int bitmapSize;
	unsigned char *data;
	
	if ((file = fopen(file_path, "rb")) == NULL) {
		return bitmap;
	}
	
	_AT_BITMAP_FILE_HEADER file_header;
	_AT_BITMAP_INFO_HEADER info_header;
	
	if (fread(&file_header, sizeof(_AT_BITMAP_FILE_HEADER), 1, file) < 1) {
		fclose(file);
		return bitmap;
	}
	
	if (fread(&info_header, sizeof(_AT_BITMAP_INFO_HEADER), 1, file) < 1) {
		fclose(file);
		return bitmap;
	}
	
	if (file_header.type != ATFileTypeBitmap) {
		fclose(file);
		return bitmap;
	}

	if ((bitmapSize = info_header.size_image) == 0) {
		bitmapSize = (info_header.width * info_header.bit_count + 7) / 8 * abs(info_header.height);
	}
	
	if ((data = malloc(bitmapSize)) == NULL) {
		fclose(file);
		return bitmap;
	}
	
	if (fread(data, 1, bitmapSize, file)) {
		free(data);
		fclose(file);
		return bitmap;
	}
	
	fclose(file);
	
	bitmap.data = data;
	bitmap.size = at_create_size(info_header.width, info_header.height);
	bitmap.bit_count = info_header.bit_count;
	
	return bitmap;
}