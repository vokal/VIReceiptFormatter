//
//  UIView+VIRF.m
//  VIReceiptFormatter
//
//  Created by Bracken Spencer <bracken.spencer@vokalinteractive.com>.
//  Copyright (c) 2012 Vokal Interactive. All rights reserved.
//

#import "UIView+VIRF.h"

@implementation UIView (VIRF)

- (UIView *)addSubviewToBottom:(UIView *)view
{
    CGFloat xOrigin = (self.frame.size.width / 2.0f) - (view.frame.size.width / 2.0f);
    [view setFrame:CGRectMake(xOrigin, self.frame.size.height, view.frame.size.width, view.frame.size.height)];
    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, (self.frame.size.height + view.frame.size.height))];
    [self addSubview:view];
    
    return self;
}

@end
