//
//  ViewController.m
//  VIReceiptFormatterExample
//
//  Created by Bracken Spencer <bracken.spencer@vokalinteractive.com>.
//  Copyright (c) 2012 Vokal Interactive. All rights reserved.
//

#import "ViewController.h"
#import "VIReceiptFormatter.h"

@interface ViewController ()

@property (assign, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

@synthesize scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIView *receiptView = [self createReceiptView];
    [scrollView addSubview:receiptView];
    [scrollView setContentSize:CGSizeMake(receiptView.frame.size.width, receiptView.frame.size.height)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (UIView *)createReceiptView
{
    NSMutableDictionary *receiptDictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    // Title
    NSString *titleString = [NSString stringWithFormat:@"Sales Receipt"];
    [receiptDictionary setObject:titleString forKey:@"title"];
    
    // Location name
    NSString *locationNameString = [NSString stringWithFormat:@"Cocoa R Us"];
    [receiptDictionary setObject:locationNameString forKey:@"location_name"];
    
    // Location ID
    NSString *locationIDString = [NSString stringWithFormat:@"Store #138"];
    [receiptDictionary setObject:locationIDString forKey:@"location_id"];
    
    // Location address
    NSString *locationAddressString = [NSString stringWithFormat:@"4154 W North Ave, Chicago IL 60639"];
    [receiptDictionary setObject:locationAddressString forKey:@"location_address"];
    
    // Location phone number
    NSString *locationPhoneString = [NSString stringWithFormat:@"(773) 555-7890"];
    [receiptDictionary setObject:locationPhoneString forKey:@"location_phone"];
    
    // Date
    NSString *dateString = [NSString stringWithFormat:@"05/01/12"];
    [receiptDictionary setObject:dateString forKey:@"date"];
    
    // Time
    NSString *timeString = [NSString stringWithFormat:@"04:30:00 PM"];
    [receiptDictionary setObject:timeString forKey:@"time"];
    
    // Register ID
    NSString *registerIDString = [NSString stringWithFormat:@"Register: 10"];
    [receiptDictionary setObject:registerIDString forKey:@"register_id"];
    
    // Clerk ID
    NSString *clerkIDString = [NSString stringWithFormat:@"Clerk: J.P."];
    [receiptDictionary setObject:clerkIDString forKey:@"clerk_id"];
    
    // Verification code
    NSString *verificationString = [NSString stringWithFormat:@"Verification: 123ABC"];
    [receiptDictionary setObject:verificationString forKey:@"verification"];
    
    // Item
    NSDictionary *item1 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"1", @"quantity",
                           @"Item #1", @"name",
                           @"$1.50", @"price",
                           @"SKU1234", @"sku",
                           @"UPC1234", @"upc",
                           @"Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item.", @"note",
                           nil];
    
    // Item
    NSDictionary *item2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"2", @"quantity",
                           @"Item #2", @"name",
                           @"$2.50", @"price",
                           @"SKU2234", @"sku",
                           @"UPC2234", @"upc",
                           @"Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item.", @"note",
                           nil];
    
    // Item
    NSDictionary *item3 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"3", @"quantity",
                           @"Item #3", @"name",
                           @"$3.50", @"price",
                           @"SKU3234", @"sku",
                           @"UPC3234", @"upc",
                           @"Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item. Note for item.", @"note",
                           nil];
    
    // Items array
    NSArray *itemsArray = [[NSArray alloc] initWithObjects:item1, item2, item3, nil];
    [receiptDictionary setObject:itemsArray forKey:@"items"];
    
    // Receipt note
    NSString *noteString = [NSString stringWithFormat:@"Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt. Note for receipt."];
    [receiptDictionary setObject:noteString forKey:@"note"];
    
    // Policy
    NSString *policyString = [NSString stringWithFormat:@"This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text. This is the policy text."];
    [receiptDictionary setObject:policyString forKey:@"policy"];
    
    // Thanks
    NSString *thanksString = [NSString stringWithFormat:@"Thank you!"];
    [receiptDictionary setObject:thanksString forKey:@"thanks"];
    
    // Create the receipt view
    VIReceiptFormatter *receiptFormatter = [[VIReceiptFormatter alloc] init];
    UIView *receiptView = [receiptFormatter receiptDictionaryToView:receiptDictionary
                                                       receiptWidth:376.0f
                                                   saveToPhotoAlbum:YES];
    
    return receiptView;
}

@end
