//
//  Border.m
//  BorderAndDiv
//
//  Created by Edward Gurnee on 3/6/14.
//  Copyright (c) 2014 emu. All rights reserved.
//

#import "Border.h"

@implementation Border

-(Border*) init {
    return [self initWithWidth:1
                      andStyle:@"solid"
                      andColor:@"black"];
}
-(Border*) initWithWidth:(int)newWidth
                andStyle:(NSString *)newStyle
                andColor:(NSString *)newColor {
    self = [super init];
    self->width = newWidth;
    self->style = newStyle;
    self->color = newColor;
    return self;
}
-(void) borderColor:(NSString *)newColor {
    self->color = newColor;
}
-(NSString*) display {
    return [NSString stringWithFormat:@"%dpx %@ %@;", self->width, self->style, self->color];
}
@end
