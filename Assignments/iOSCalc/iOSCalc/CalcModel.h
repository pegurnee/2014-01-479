//
//  CalcModel.h
//  SimpleCalc
//
//  Created by Chris Ball (chris.m.ball@gmail.com) on 1/17/08.
//  Copyright 2008, Chris Ball, Strainthebrain.Blogspot.Com.
//  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcModel : NSObject {
    NSDecimal *running_total;
    char  sign_state;
    bool  first_call;
}

//Establishing some public-facing properties.
@property(readwrite) NSDecimal running_total;
@property(readwrite) char  sign_state;
@property(readwrite) bool  first_call;

//Used for computing and maintaing the model data.
- (void) computeNewDisplayVal: (NSDecimal) currDisplayVal;

@end
