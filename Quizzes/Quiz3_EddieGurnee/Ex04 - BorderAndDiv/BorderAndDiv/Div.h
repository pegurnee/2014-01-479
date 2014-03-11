//
//  Div.h
//  BorderAndDiv
//
//  Created by Edward Gurnee on 3/6/14.
//  Copyright (c) 2014 emu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Border.h"

@interface Div : NSObject {
    NSArray* border;
}

-(Div*) init;
-(Div*) initWithBorder: (Border*) b1 andOtherBorder: (Border*) b2;
-(Border*) getBorder: (int) i;
-(void) displayLocation: (int) loc withBorder: (Border*) b;

@end
