//
//  Account.h
//  BankAccount
//
//  Created by Edward Gurnee on 1/23/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property float balance;

- (void) deposit: (float) depositAmount;
- (void) withdraw: (float) withdrawAmount;

@end
