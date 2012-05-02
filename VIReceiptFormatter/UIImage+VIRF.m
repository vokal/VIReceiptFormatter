//
//  UIImage+VIRF.m
//  VIReceiptFormatter
//
//  Created by Bracken Spencer <bracken.spencer@vokalinteractive.com>.
//  Copyright (c) 2012 Vokal Interactive. All rights reserved.
//

#import "UIImage+VIRF.h"

@implementation UIImage (VIRF)

- (void)saveToPhotoAlbum
{
    UIImageWriteToSavedPhotosAlbum(self, nil, nil, nil);
}

@end
