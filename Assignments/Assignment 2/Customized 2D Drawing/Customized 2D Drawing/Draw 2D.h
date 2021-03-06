//
//  Draw 2D.h
//  Customized 2D Drawing
//
//  Created by Edward Gurnee on 2/17/14.
//  Copyright (c) 2014 Eddie Gurnee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Draw_2D : UIView

@property float size;
@property float red_value;
@property float green_value;
@property float blue_value;
@property BOOL fill_it;
@property BOOL clear_only;

@property (nonatomic) CGPoint firstTouch;
@property (nonatomic) CGPoint lastTouch;
@property (strong, nonatomic) UIColor *currentColor;
@property (nonatomic) int shapeType;
@property (nonatomic, strong) UIImage *drawImage;
@property (readonly) CGRect currentRect;
@property CGRect redrawRect;

@end
