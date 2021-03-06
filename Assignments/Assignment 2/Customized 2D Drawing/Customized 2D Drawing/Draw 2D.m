//
//  Draw 2D.m
//  Customized 2D Drawing
//
//  Created by Edward Gurnee on 2/17/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import "Draw 2D.h"

@implementation Draw_2D

@synthesize size;
@synthesize red_value;
@synthesize green_value;
@synthesize blue_value;
@synthesize fill_it;
@synthesize clear_only;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGRect)currentRect {
    return CGRectMake (_firstTouch.x,
                       _firstTouch.y,
                       _lastTouch.x - _firstTouch.x,
                       _lastTouch.y - _firstTouch.y);
}

- (id)initWithCoder:(NSCoder*)coder {
    if (self = [super initWithCoder:coder]) {
        red_value = 127.5 / 255.0f;
        green_value = 127.5/ 255.0f;
        blue_value = 127.5/ 255.0f;
        size = 10.0;
        fill_it = YES;
        _currentColor = [UIColor colorWithRed:(red_value) green:(green_value) blue:(blue_value) alpha:1];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    
        CGFloat horizontalOffset = _drawImage.size.width / 2;
        CGFloat verticalOffset = _drawImage.size.height / 2;
        _redrawRect = CGRectUnion(_redrawRect,
                                  CGRectMake(_lastTouch.x - horizontalOffset,
                                             _lastTouch.y - verticalOffset,
                                             _drawImage.size.width,
                                             _drawImage.size.height));
    
    _redrawRect = CGRectInset(_redrawRect, -2.0, -2.0);
    clear_only = NO;
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
           CGFloat horizontalOffset = _drawImage.size.width / 2;
        CGFloat verticalOffset = _drawImage.size.height / 2;
        _redrawRect = CGRectUnion(_redrawRect,
                                  CGRectMake(_lastTouch.x - horizontalOffset,
                                             _lastTouch.y - verticalOffset,
                                             _drawImage.size.width,
                                             _drawImage.size.height));
    
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
        
    CGContextSetLineWidth(context, size);
    CGContextSetStrokeColorWithColor(context, _currentColor.CGColor);
    if (fill_it) {
        CGContextSetFillColorWithColor(context, _currentColor.CGColor);
    } else {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    }
    switch (_shapeType) {
        case 0:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case 1:
            CGContextMoveToPoint(context, (_firstTouch.x + _lastTouch.x) / 2, _firstTouch.y);
            CGContextAddLineToPoint(context, _lastTouch.x, (_firstTouch.y + _lastTouch.y) / 2);
            CGContextAddLineToPoint(context, (_firstTouch.x + _lastTouch.x) / 2, _lastTouch.y);
            CGContextAddLineToPoint(context, _firstTouch.x, (_firstTouch.y + _lastTouch.y) / 2);
            
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case 2:
            CGContextAddArc(context,
                            (_firstTouch.x + _lastTouch.x) / 2,
                            (_firstTouch.y + _lastTouch.y) / 2,
                            sqrt(
                                 pow(_lastTouch.x - _firstTouch.x, 2) +
                                 pow(_lastTouch.y - _firstTouch.y, 2)
                                ) / 2,
                            0,
                            2 * M_PI,
                            0);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case 3:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        default:
            break;
    }
}


@end
