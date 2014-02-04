//
//  main.m
//  Quiz0_EddieGurnee
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Prof.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
       
        Student* s1 = [[Student alloc] initWithNone];
        
        Student* s2 = [[Student alloc] initWithID: 100 andName: @"John" andGPA: 3.8f];
            if ([s2 goodStudent]) {
                NSLog(@"%@ -> GOOD ", [s2 disp]);
            }
            
        Prof* p1 = [[Prof alloc] initWithName: @"Mary" andDept: @"MATH"];
        NSLog(@"%@ works in %@ department", [p1 Name], [p1 Dept]);        
        
    }
    return 0;
}

