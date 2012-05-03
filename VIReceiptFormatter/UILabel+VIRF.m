//
//  UILabel+VIRF.m
//  VIReceiptFormatter
//
//  Created by Bracken Spencer <bracken.spencer@vokalinteractive.com>.
//  Copyright (c) 2012 Vokal Interactive. All rights reserved.
//

#import "UILabel+VIRF.h"

@implementation UILabel (VIRF)

- (void)sizeToFitFixedWidth:(CGFloat)fixedWidth
{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, fixedWidth, 0.0f)];
    [self setLineBreakMode:UILineBreakModeWordWrap];
    [self setNumberOfLines:0];
    [self sizeToFit];
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, fixedWidth, self.frame.size.height)];
}

@end
