//
//  Prof.m
//  Quiz0_EddieGurnee
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "Prof.h"

@implementation Prof
-(Prof*) initWithName: (NSString*) n
              andDept: (NSString*) d {
    self = [super init];
    if (self) {
        [self setTwoName: n andDept: d];
    }
    return self;
}
-(void) setName: (NSString*) n {
    self->Name = n;
}
-(void) setDept: (NSString*) d {
    self->Dept = d;
}
-(void) setTwoName: (NSString*) n
           andDept: (NSString*) d {
    [self setName: n];
    [self setDept: d];
}
-(NSString*) Name {
    return Name;
}
-(NSString*) Dept {
    return Dept;
}
@end
