//
//  Top.h
//  DeskProject
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Top : NSObject {
    
@public
    NSString* info;
}

-(Top*) initWithInfo: (NSString*) str;
-(NSString*) display;

@end
