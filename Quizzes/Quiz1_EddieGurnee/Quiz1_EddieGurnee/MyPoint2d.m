//
//  MyPoint2d.m
//  Quiz1_EddieGurnee
//
//  Created by Edward Gurnee on 1/21/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "MyPoint2d.h"

@implementation MyPoint2d
-(MyPoint2d*) initWithX: (int) theX
                   andY: (int) theY
               andpName: (NSString*) thepName {
    self = [super init];
    if (self) {
        [self setX: theX];
        [self setY: theY];
        [self setpName: thepName];
    }
    return self;
}
-(int) x {
    return x;
}
-(void) setX: (int) theX {
    self->x = theX;
}
-(int) y {
    return y;
}
-(void) setY: (int) theY {
    self->y = theY;
}
-(void) setpName: (NSString*) thepName {
    self->pName = thepName;
}
-(NSString*) pName {
    return pName;
}
-(int) distanceToOtherPoint: (MyPoint2d*) p
                       andX: (int) theX
                       andY: (int) theY {
    return (([p x] - theX) +
            ([p y] - theY));
}
@end
