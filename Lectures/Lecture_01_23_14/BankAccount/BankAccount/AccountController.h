//
//  AccountController.h
//  BankAccount
//
//  Created by Edward Gurnee on 1/23/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface AccountController : NSObject

@property (weak) IBOutlet NSTextField *display;
@property (nonatomic, strong) Account *account;
@property (weak) IBOutlet NSTextField *input;

- (IBAction)deposit:(id)sender;
- (IBAction)withdraw:(id)sender;

@end
