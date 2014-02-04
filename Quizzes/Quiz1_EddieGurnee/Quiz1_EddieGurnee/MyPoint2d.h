//
//  MyPoint2d.h
//  Quiz1_EddieGurnee
//
//  Created by Edward Gurnee on 1/21/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPoint2d : NSObject {
    @protected
    int x;
    int y;
    NSString* pName;
}
-(MyPoint2d*) initWithX: (int) theX
                   andY: (int) theY
               andpName: (NSString*) thepName;
-(int) x;
-(void) setX: (int) theX;
-(int) y;
-(void) setY: (int) theY;
-(NSString*) pName;
-(void) setpName: (NSString*) thepName;
-(int) distanceToOtherPoint: (MyPoint2d*) p
                       andX: (int) theX
                       andY: (int) theY;
@end
