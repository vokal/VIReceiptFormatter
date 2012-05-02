//
//  VIReceiptFormatterExampleTests.m
//  VIReceiptFormatterExampleTests
//
//  Created by Bracken Spencer <bracken.spencer@vokalinteractive.com>.
//  Copyright (c) 2012 Vokal Interactive. All rights reserved.
//

#import "VIReceiptFormatterExampleTests.h"
#import "VIReceiptFormatter.h"

@implementation VIReceiptFormatterExampleTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testReceiptDictionaryToView
{
    CGFloat widthFloat = 376.0f;
    CGFloat heightFloat = 1540.0f;
    
    NSMutableDictionary *receiptDictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    NSString *locationNameString = [NSString stringWithFormat:@"Store Name"];
    [receiptDictionary setObject:locationNameString forKey:@"location_name"];
    
    NSString *locationIDString = [NSString stringWithFormat:@"Store #1"];
    [receiptDictionary setObject:locationIDString forKey:@"location_id"];
    
    NSString *locationAddressString = [NSString stringWithFormat:@"12345 Main St, Anytown, Anywhere 12345"];
    [receiptDictionary setObject:locationAddressString forKey:@"location_address"];
    
    NSString *locationPhoneString = [NSString stringWithFormat:@"(123) 456-7890"];
    [receiptDictionary setObject:locationPhoneString forKey:@"location_phone"];
    
    NSString *dateString = [NSString stringWithFormat:@"01/01/01"];
    [receiptDictionary setObject:dateString forKey:@"date"];
    
    NSString *timeString = [NSString stringWithFormat:@"01:01:00 PM"];
    [receiptDictionary setObject:timeString forKey:@"time"];
    
    NSString *registerIDString = [NSString stringWithFormat:@"Register: #1"];
    [receiptDictionary setObject:registerIDString forKey:@"register_id"];
    
    NSString *clerkIDString = [NSString stringWithFormat:@"Clerk: Name"];
    [receiptDictionary setObject:clerkIDString forKey:@"clerk_id"];
    
    NSString *verificationString = [NSString stringWithFormat:@"123ABC"];
    [receiptDictionary setObject:verificationString forKey:@"verification"];
    
    NSDictionary *item1 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"1", @"quantity", // -- Allowed: 1
                           @"Item #1", @"name", // -- Allowed: 1
                           @"$1.50", @"price", // -- Allowed: 1
                           @"SKU1234", @"sku", // -- Allowed: 0 or 1
                           @"UPC1234", @"upc", // -- Allowed: 0 or 1
                           @"Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item.", @"note", // Allowed: 0 or 1
                           nil];
    NSDictionary *item2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"2", @"quantity",
                           @"Item #2", @"name",
                           @"$2.50", @"price",
                           @"SKU1234", @"sku",
                           @"UPC1234", @"upc",
                           @"Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item.", @"note",
                           nil];
    NSDictionary *item3 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"3", @"quantity",
                           @"Item #3", @"name",
                           @"$3.50", @"price",
                           @"SKU1234", @"sku",
                           @"UPC1234", @"upc",
                           @"Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item.", @"note",
                           nil];
    
    NSArray *itemsArray = [[NSArray alloc] initWithObjects:item1, item2, item3, nil];
    [receiptDictionary setObject:itemsArray forKey:@"items"];
    
    NSString *noteString = [NSString stringWithFormat:@"Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt."];
    [receiptDictionary setObject:noteString forKey:@"note"];
    
    NSString *policyString = [NSString stringWithFormat:@"This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text."];
    [receiptDictionary setObject:policyString forKey:@"policy"];
    
    NSString *thanksString = [NSString stringWithFormat:@"Thank you!"];
    [receiptDictionary setObject:thanksString forKey:@"thanks"];
    
    VIReceiptFormatter *receiptFormatter = [[VIReceiptFormatter alloc] init];
    UIView *receiptView = [receiptFormatter receiptDictionaryToView:receiptDictionary receiptWidth:widthFloat];
    
    NSAssert((receiptView.frame.size.width == widthFloat), @"Receipt view is wrong width (%f), it should be %f", receiptView.frame.size.width, widthFloat);
    NSAssert((receiptView.frame.size.height == heightFloat), @"Receipt view is wrong height (%f), it should be %f", receiptView.frame.size.height, heightFloat);
}

@end
