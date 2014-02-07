//
//  CalcModel.m
//  SimpleCalc
//
//  Created by Chris Ball (chris.m.ball@gmail.com) on 1/17/08.
//  Copyright 2008, Chris Ball, Strainthebrain.Blogspot.Com.
//  All rights reserved.
//

#import "CalcModel.h"

@implementation CalcModel

//Implicity declaring the setters/getters for our properties.
@synthesize running_total, sign_state, first_call;

- (void) computeNewDisplayVal: (NSDecimal) currDisplayVal {
    if (self.first_call) {
        self.running_total = currDisplayVal;
        self.first_call = NO;
    }
    else {
        switch (self.sign_state) {
            case 'a':
                self.running_total = self.running_total + currDisplayVal;
                break;
            case 'd':
                self.running_total = self.running_total / currDisplayVal;
                break;
            case 'm':
                self.running_total = self.running_total * currDisplayVal;
                break;
            case 's':
                self.running_total = self.running_total - currDisplayVal;
                break;
        }
    }
}

@end
