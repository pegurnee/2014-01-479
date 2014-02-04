//
//  ThirdOC.h
//  Third
//
//  Created by Edward Gurnee on 1/14/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThirdOC : NSObject {
    int i;
    NSString *str;
}

-(void) setI: (int) i;
-(void) setStr: (NSString*) s;
-(void) setI:(int)i Str: (NSString*) s;
-(int) i;
-(NSString*) str;

@end
