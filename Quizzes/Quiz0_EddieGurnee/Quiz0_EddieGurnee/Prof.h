//
//  Prof.h
//  Quiz0_EddieGurnee
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Prof : NSObject {
    @private
    NSString* Name;
    NSString* Dept;
}

-(Prof*) initWithName: (NSString*) n
              andDept: (NSString*) d;
-(void) setName: (NSString*) n;
-(void) setDept: (NSString*) d;
-(void) setTwoName: (NSString*) n
           andDept: (NSString*) d;
-(NSString*) Name;
-(NSString*) Dept;

@end
