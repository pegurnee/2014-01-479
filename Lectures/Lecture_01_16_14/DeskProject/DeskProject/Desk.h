//
//  Desk.h
//  DeskProject
//
//  Created by Edward Gurnee on 1/16/14.
//  Copyright (c) 2014 Edward Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Top.h"

@interface Desk : NSObject {
    
@private
    Top* top;
    int legs;
}
-(Desk*) initWithInfo: (NSString*) info
              andLegs: (int) n;
-(void) display;
-(int) legs;


@end

