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
@synthesize blue_value;
@synthesize green_value;

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
        _currentColor = [UIColor redColor];
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
    [self setNeedsDisplayInRect:_redrawRect];
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
    [self setNeedsDisplayInRect:_redrawRect];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
        
    CGContextSetLineWidth(context, size);
    CGContextSetStrokeColorWithColor(context, [UIColor
                                               redColor].CGColor);
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 250, 250);
    CGContextStrokePath(context);     
}


@end
