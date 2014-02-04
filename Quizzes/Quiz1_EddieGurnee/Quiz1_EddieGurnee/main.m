//
//  main.m
//  Quiz1_EddieGurnee
//
//  Created by Edward Gurnee on 1/21/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPoint2d.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        MyPoint2d* p1 = [[MyPoint2d alloc] initWithX: 10 andY: 10 andpName: @"first"];
        MyPoint2d* p2 = [[MyPoint2d alloc] initWithX: 20 andY: 30 andpName: @"second"];
        
        NSLog(@"%@ to %@ is: %d",
              [p1 pName],
              [p2 pName],
              [p1 distanceToOtherPoint: p2
                                  andX: [p1 x]
                                  andY: [p1 y]]);
        
    }
    return 0;
}

