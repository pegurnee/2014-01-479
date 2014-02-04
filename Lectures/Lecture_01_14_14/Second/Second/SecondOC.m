//
//  SecondOC.m
//  Second
//
//  Created by Edward Gurnee on 1/14/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "SecondOC.h"

@implementation SecondOC

-(SecondOC *) initWithNone {
    self = [super init];
    if (self) {
        theI = 2014;
        str = @"Second Objective C example.";
    }
    return self;
}

    -(SecondOC *) initWithI: (int) i Str: (NSString*) s {
        self = [super init];
        if (self) {
            self->theI = i;
            str = s;
        }
        
        return self;
    }

@end
