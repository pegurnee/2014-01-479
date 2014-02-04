//
//  Top.m
//  DeskProject
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import "Top.h"

@implementation Top

-(Top*) initWithInfo: (NSString*) str {
    self = [super init];
    
    self->info = str;
    return self;
}
-(NSString*) display {
    return info;
}

@end
