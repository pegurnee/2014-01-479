//
//  SecondOC.h
//  Second
//
//  Created by Edward Gurnee on 1/14/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondOC : NSObject {

@public
    int theI;
    NSString *str;
}

-(SecondOC *) initWithNone;
// -(SecondOC *) initWithNone; // no argument constructor
-(SecondOC *) initWithI: (int) i Str: (NSString*) s;
// -(SecondOC *) initWithI: (int) i Str: (NSString*) s; // two argument constuctor

@end
