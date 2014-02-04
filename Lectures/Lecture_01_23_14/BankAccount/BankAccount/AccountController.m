//
//  AccountController.m
//  BankAccount
//
//  Created by Edward Gurnee on 1/23/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "AccountController.h"

@implementation AccountController

@synthesize display;
@synthesize account;
@synthesize input;

- (IBAction)deposit:(id)sender {
    [account deposit: [[input stringValue] floatValue]];
	[display setFloatValue: [account balance]];
}
- (IBAction)withdraw:(id)sender {
    [account withdraw: [[input stringValue] floatValue]];
	[display setFloatValue: [account balance]];
}
- (void) awakeFromNib {
	account = [[Account alloc] init];
	[display setFloatValue: [account balance]];
}

@end
