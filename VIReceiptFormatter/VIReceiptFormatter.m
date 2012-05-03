//
//  VIReceiptFormatter.m
//  VIReceiptFormatter
//
//  Created by Bracken Spencer <bracken.spencer@vokalinteractive.com>.
//  Copyright (c) 2012 Vokal Interactive. All rights reserved.
//

#import "VIReceiptFormatter.h"
#import "UIImage+VIRF.h"
#import "UILabel+VIRF.h"
#import "UIView+VIRF.h"

#define kLabelFont              [UIFont fontWithName:@"Courier" size:14.0f]
#define kLabelHeightFloat       21.0f
#define kViewBackgroundColor    [UIColor whiteColor]
#define kLineHeight             2.0f
#define kLineColor              [UIColor blackColor]

@implementation VIReceiptFormatter

- (UIView *)receiptDictionaryToView:(NSDictionary *)receiptDictionary
                       receiptWidth:(CGFloat)widthFloat
                   saveToPhotoAlbum:(BOOL)saveToPhotoAlbumBool
{
    UIView *receiptView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, widthFloat, 0.0f)];
    [receiptView setBackgroundColor:kViewBackgroundColor];
    
    [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    
    // Title
    NSString *titleString = [receiptDictionary objectForKey:@"title"];
    if ([titleString length] > 0) {
        [receiptView addSubviewToBottom:[self make1Column:widthFloat string:titleString]];
        [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    }
    
    // Location name
    NSString *locationNameString = [receiptDictionary objectForKey:@"location_name"];
    [receiptView addSubviewToBottom:[self make1Column:widthFloat string:locationNameString]];
    
    // Location ID
    NSString *locationIDString = [receiptDictionary objectForKey:@"location_id"];
    [receiptView addSubviewToBottom:[self make1Column:widthFloat string:locationIDString]];
    
    // Location address
    NSString *locationAddressString = [receiptDictionary objectForKey:@"location_address"];
    [receiptView addSubviewToBottom:[self make1Column:widthFloat string:locationAddressString]];
    
    // Location phone
    NSString *locationPhoneString = [receiptDictionary objectForKey:@"location_phone"];
    [receiptView addSubviewToBottom:[self make1Column:widthFloat string:locationPhoneString]];
    [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    
    // Date, time, register ID, clerk ID
    NSString *dateString = [receiptDictionary objectForKey:@"date"];
    NSString *timeString = [receiptDictionary objectForKey:@"time"];
    NSString *registerIDString = [receiptDictionary objectForKey:@"register_id"];
    NSString *clerkIDString = [receiptDictionary objectForKey:@"clerk_id"];
    
    [receiptView addSubviewToBottom:[self make2Columns:widthFloat
                                               string1:dateString
                                               string2:registerIDString]];
    [receiptView addSubviewToBottom:[self make2Columns:widthFloat
                                               string1:timeString
                                               string2:clerkIDString]];
    [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    
    // Verification code
    NSString *verificationString = [receiptDictionary objectForKey:@"verification"];
    if ([verificationString length] > 0) {
        [receiptView addSubviewToBottom:[self make1ColumnLine:widthFloat]];
        [receiptView addSubviewToBottom:[self make1Column:widthFloat string:verificationString]];
        [receiptView addSubviewToBottom:[self make1ColumnLine:widthFloat]];
        [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    }
    
    // Items
    NSArray *itemsArray = [receiptDictionary objectForKey:@"items"];
    if ([itemsArray count] > 0) {
        [receiptView addSubviewToBottom:[self makeItemColumns:widthFloat
                                                      string1:@"Qty"
                                                      string2:@"Item"
                                                      string3:@"Price"]];
        for (int i = 0; i < [itemsArray count]; i++) {
            NSDictionary *itemDictionary = [itemsArray objectAtIndex:i];
            
            // Item quantity, name, price
            NSString *quantityString = [itemDictionary objectForKey:@"quantity"];
            NSString *nameString = [itemDictionary objectForKey:@"name"];
            NSString *priceString = [itemDictionary objectForKey:@"price"];
            [receiptView addSubviewToBottom:[self makeItemColumns:widthFloat
                                                          string1:quantityString
                                                          string2:nameString
                                                          string3:priceString]];
            
            // Item SKU
            NSString *skuString = [itemDictionary objectForKey:@"sku"];
            [receiptView addSubviewToBottom:[self makeItemColumns:widthFloat
                                                          string1:@""
                                                          string2:skuString
                                                          string3:@""]];
            
            // Item UPC
            NSString *upcString = [itemDictionary objectForKey:@"upc"];
            [receiptView addSubviewToBottom:[self makeItemColumns:widthFloat
                                                          string1:@""
                                                          string2:upcString
                                                          string3:@""]];
            
            // Item note
            NSString *noteString = [itemDictionary objectForKey:@"note"];
            [receiptView addSubviewToBottom:[self makeItemColumns:widthFloat
                                                          string1:@""
                                                          string2:noteString
                                                          string3:@""]];
        }
        [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    }
    
    // Receipt note
    NSString *noteString = [receiptDictionary objectForKey:@"note"];
    if ([noteString length] > 0) {
        [receiptView addSubviewToBottom:[self make1Column:widthFloat string:noteString]];
        [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    }
    
    // Policy
    NSString *policyString = [receiptDictionary objectForKey:@"policy"];
    if ([policyString length] > 0) {
        [receiptView addSubviewToBottom:[self make1Column:widthFloat string:policyString]];
        [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    }
    
    // Thanks
    NSString *thanksString = [receiptDictionary objectForKey:@"thanks"];
    if ([thanksString length] > 0) {
        [receiptView addSubviewToBottom:[self make1Column:widthFloat string:thanksString]];
        [receiptView addSubviewToBottom:[self make1ColumnLinefeed:widthFloat]];
    }
    
    return receiptView;
}

#pragma mark - Helper methods

- (UIView *)make1ColumnLine:(CGFloat)widthFloat
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, widthFloat, kLineHeight)];
    [view setBackgroundColor:kLineColor];
    
    return view;
}

- (UIView *)make1ColumnLinefeed:(CGFloat)widthFloat
{
    UIView *view = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, widthFloat, kLabelHeightFloat)];
    [view setBackgroundColor:kViewBackgroundColor];
    
    return view;
}

- (UILabel *)make1Column:(CGFloat)widthFloat string:(NSString *)string
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, widthFloat, kLabelHeightFloat)];
    [label setFont:kLabelFont];
    [label setText:string];
    [label setBackgroundColor:kViewBackgroundColor];
    [label setTextAlignment:UITextAlignmentCenter];
    [label sizeToFitFixedWidth:widthFloat];
    
    return label;
}

- (UIView *)make2Columns:(CGFloat)widthFloat
                 string1:(NSString *)string1
                 string2:(NSString *)string2
{
    UILabel *column1 = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, (widthFloat * 0.50f), kLabelHeightFloat)];
    [column1 setFont:kLabelFont];
    [column1 setText:string1];
    [column1 setTextAlignment:UITextAlignmentLeft];
    [column1 sizeToFitFixedWidth:(widthFloat * 0.50f)];
    
    UILabel *column2 = [[UILabel alloc] initWithFrame:CGRectMake((widthFloat * 0.50f), 0.0f, (widthFloat * 0.50f), kLabelHeightFloat)];
    [column2 setFont:kLabelFont];
    [column2 setText:string2];
    [column2 setTextAlignment:UITextAlignmentRight];
    [column2 sizeToFitFixedWidth: (widthFloat * 0.50f)];
    
    // Make an array of the label heights
    NSArray *heightsArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:column1.frame.size.height], [NSNumber numberWithFloat:column2.frame.size.height], nil];
    
    // Sort the array
    NSArray *sortedHeightsArray = [heightsArray sortedArrayUsingComparator: ^(id height1, id height2) {
        if ([height1 floatValue] > [height2 floatValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([height1 floatValue] < [height2 floatValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    // Get the first array object (the largest label height)
    CGFloat heightFloat = [[sortedHeightsArray objectAtIndex:0] floatValue];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, widthFloat, heightFloat)];
    [view setBackgroundColor:kViewBackgroundColor];
    [view addSubview:column1];
    [view addSubview:column2];
    
    return view;
}

- (UIView *)makeItemColumns:(CGFloat)widthFloat
                    string1:(NSString *)string1
                    string2:(NSString *)string2
                    string3:(NSString *)string3
{
    UILabel *column1 = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, (widthFloat * 0.15f), kLabelHeightFloat)];
    [column1 setFont:kLabelFont];
    [column1 setText:string1];
    [column1 setTextAlignment:UITextAlignmentLeft];
    [column1 sizeToFitFixedWidth:(widthFloat * 0.15f)];
    
    UILabel *column2 = [[UILabel alloc] initWithFrame:CGRectMake((widthFloat * 0.15f), 0.0f, (widthFloat * 0.52f), kLabelHeightFloat)];
    [column2 setFont:kLabelFont];
    [column2 setText:string2];
    [column2 setTextAlignment:UITextAlignmentLeft];
    [column2 sizeToFitFixedWidth: (widthFloat * 0.52f)];
    
    UILabel *column3 = [[UILabel alloc] initWithFrame:CGRectMake((widthFloat * 0.67f), 0.0f, (widthFloat * 0.33f), kLabelHeightFloat)];
    [column3 setFont:kLabelFont];
    [column3 setText:string3];
    [column3 setTextAlignment:UITextAlignmentRight];
    [column3 sizeToFitFixedWidth:(widthFloat * 0.33f)];
    
    // Make an array of the label heights
    NSArray *heightsArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:column1.frame.size.height], [NSNumber numberWithFloat:column2.frame.size.height], [NSNumber numberWithFloat:column3.frame.size.height], nil];
    
    // Sort the array
    NSArray *sortedHeightsArray = [heightsArray sortedArrayUsingComparator: ^(id height1, id height2) {
        if ([height1 floatValue] > [height2 floatValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([height1 floatValue] < [height2 floatValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    // Get the first array object (the largest label height)
    CGFloat heightFloat = [[sortedHeightsArray objectAtIndex:0] floatValue];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, widthFloat, heightFloat)];
    [view setBackgroundColor:kViewBackgroundColor];
    [view addSubview:column1];
    [view addSubview:column2];
    [view addSubview:column3];
    
    return view;
}

@end
