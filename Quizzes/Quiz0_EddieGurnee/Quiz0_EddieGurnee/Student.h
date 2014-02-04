//
//  Student.h
//  Quiz0_EddieGurnee
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {
    @private
    int ID;
    NSString* Name;
    float GPA;
}
-(Student*) initWithNone;
-(Student*) initWithID: (int) theId
               andName: (NSString*) name
                andGPA: (float) gpa;
-(NSString*) disp;
-(BOOL) goodStudent;

@end
