//
//  main.m
//  DeskProject
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Desk.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Desk* t1 = [[Desk alloc] initWithInfo: @"wood"
                                      andLegs: 4];
		[t1 display];
        
		
        Desk* t2 = [[Desk alloc] initWithInfo: @"marbo"
                                      andLegs: 3];
		[t2 display];
        
    }
    return 0;
}

