//
//  Border.h
//  BorderAndDiv
//
//  Created by Edward Gurnee on 3/6/14.
//  Copyright (c) 2014 emu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Border : NSObject {
    int width;
    NSString *style;
    NSString *color;
}

-(Border*) initWithWidth: (int) width
                andStyle: (NSString*) style
                andColor: (NSString*) color;
-(Border*) init;
-(void) borderColor: (NSString*) color;
-(NSString*) display;

@end
