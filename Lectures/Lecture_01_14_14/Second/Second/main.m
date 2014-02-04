//
//  main.m
//  Second
//
//  Created by Edward Gurnee on 1/14/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondOC.h"

int main(int argc, const char * argv[]) {
    
    SecondOC *oc1 = [[SecondOC alloc] initWithNone];
    SecondOC *oc2 = [[SecondOC alloc] initWithI: 2013 Str:@"Second OC"];
    
    @autoreleasepool {
        
        // insert code here...
        // NOT WORKING -- str and i are proctected without @public
        // NSLog(@"%@ %i", oc1->str, oc1->i);
        
        NSLog(@"%@ %d", oc1->str, oc1->theI);
        NSLog(@"%@ %d", oc2->str, oc2->theI);
    }
    return 0;
}



