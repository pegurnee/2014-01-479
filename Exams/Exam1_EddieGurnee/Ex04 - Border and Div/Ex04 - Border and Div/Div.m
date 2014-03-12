//
//  Div.m
//  BorderAndDiv
//
//  Created by Edward Gurnee on 3/6/14.
//  Copyright (c) 2014 emu. All rights reserved.
//

#import "Div.h"

@implementation Div

-(Div*) init {
    return [self initWithBorder: [[Border alloc] init] andOtherBorder: [[Border alloc] init]];
}

-(Div*) initWithBorder:(Border *)b1 andOtherBorder:(Border *)b2 {
    self = [super init];
    border = [[NSArray alloc] initWithObjects:b1, b2, b1, b2, nil];
    return self;
}

-(Border*) getBorder:(int)i {
    return border[i];
}
-(void) displayLocation:(int)loc
             withBorder:(Border *)b {
    switch (loc) {
        case 0:
            NSLog(@"border_north: %@", b.display);
            break;
        case 1:
            NSLog(@"border_right: %@", b.display);
            break;
        case 2:
            NSLog(@"border_bottom: %@", b.display);
            break;
        case 3:
            NSLog(@"border_left: %@", b.display);
            break;
    }
}
@end
