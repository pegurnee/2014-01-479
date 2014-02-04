//
//  Account.m
//  BankAccount
//
//  Created by Edward Gurnee on 1/23/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "Account.h"

@implementation Account

@synthesize balance;

- (id) init {
	if (self = [super init]) {
		balance = 100.0f;
	}
	return (self);
}

- (void) deposit:(float)depositAmount {
	balance += depositAmount;
}

- (void) withdraw:(float)withdrawAmount {
	balance -= withdrawAmount;
}

@end
