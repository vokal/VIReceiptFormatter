//
//  VIReceiptFormatter.h
//  VIReceiptFormatter
//
//  Created by Bracken Spencer <bracken.spencer@vokalinteractive.com>.
//  Copyright (c) 2012 Vokal Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VIReceiptFormatter : NSObject

- (UIView *)receiptDictionaryToView:(NSDictionary *)receiptDictionary receiptWidth:(CGFloat)widthFloat;

@end
