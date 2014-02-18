//
//  Draw 2D.m
//  Customized 2D Drawing
//
//  Created by Edward Gurnee on 2/17/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "Draw 2D.h"

@implementation Draw_2D

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    /*
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor
                                               blueColor].CGColor);
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 250, 250);
    CGContextStrokePath(context);
     */
}

-(void)drawRect:(CGRect)rect withColor:(CGColorRef)color {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, color);
    NSLog(@"%@", color);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 300, 400);
    CGContextStrokePath(context);
}



@end
