//
//  Student.m
//  Quiz0_EddieGurnee
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "Student.h"

@implementation Student

-(Student*) initWithNone {
    return [self initWithID: 0 andName: @"" andGPA: 0.0f];
}
-(Student*) initWithID: (int) theId
               andName: (NSString*) name
                andGPA: (float) gpa {
    self = [super init];
    if (self) {
        self->ID = theId;
        self->Name = name;
        self->GPA = gpa;
    }
    return self;
}
-(NSString*) disp {
    return [NSString stringWithFormat: @"%i: %@ with %f", ID, Name, GPA];
}
-(BOOL) goodStudent {
    return GPA > 3.5;
}

@end
