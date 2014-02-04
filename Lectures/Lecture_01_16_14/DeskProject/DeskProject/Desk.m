//
//  Desk.m
//  DeskProject
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "Desk.h"
#import "Top.h"

@implementation Desk

-(Desk*) initWithInfo: (NSString*) info
              andLegs: (int) n {
    self = [super init];
    
    self->top = [[Top alloc] initWithInfo: info];
    self->legs = n;
    return self;
}
-(void) display {
    NSLog(@"This %@ desk has %d legs", [top display], legs);
}
-(int) legs {
    return legs;
}

@end
