//
//  main.m
//  BorderAndDiv
//
//  Created by Edward Gurnee on 3/6/14.
//  Copyright (c) 2014 emu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Border.h"
#import "Div.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Div* d1 = [[Div alloc] init];
        for (int i = 0; i < 4; i++) {
            [d1 displayLocation:i withBorder: [d1 getBorder: i]];
        }
        
        
        Div* d2 = [[Div alloc] initWithBorder:[[Border alloc] initWithWidth: 1
                                                                   andStyle:@"solid"
                                                                   andColor: @"red"]
                               andOtherBorder:[[Border alloc] initWithWidth: 1
                                                                   andStyle:@"dotted"
                                                                   andColor: @"blue"]];
        for (int i = 0; i < 4; i++) {
            [d2 displayLocation:i withBorder: [d2 getBorder: i]];
        }
        
        
    }
    
    return 0;
}

