//
//  DrawView.m
//  Quiz8
//
//  Created by Ryan on 4/14/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "DrawView.h"
#import "ObjPoint.h"

@implementation DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.penPositionIsSet = true;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Initialize pen in the middle of the screen
    if (self.penPositionIsSet == false) {
        self.penPosition = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
        self.penPositionIsSet = true;
    }
    
    // Draw the pen's position
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    [[UIColor whiteColor] set];
    CGContextMoveToPoint(context, self.penPosition.x, self.penPosition.y);
    CGContextAddLineToPoint(context, self.penPosition.x, self.penPosition.y);
    CGContextStrokePath(context);
    
    // If pen is the first point
    if (!self.points || self.points.count == 0) {
        self.points = [[NSMutableArray alloc] init];
        ObjPoint *point = [[ObjPoint alloc] init];
        point.x = [NSNumber numberWithFloat:self.penPosition.x];
        point.y = [NSNumber numberWithFloat:self.penPosition.y];
        [self.points addObject:point];
        return;
    }
    
    // Draw lines
    [[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] set];
    CGContextSetLineWidth(context, 1.0);
    for (int i = 0; i < self.points.count; i++) {
        ObjPoint *firstPoint = [self.points objectAtIndex:i];
        if (i != (self.points.count - 1)) {
            ObjPoint *secondPoint = [self.points objectAtIndex:(i + 1)];
            CGContextMoveToPoint(context, [firstPoint.x floatValue], [firstPoint.y floatValue]);
            CGContextAddLineToPoint(context, [secondPoint.x floatValue], [secondPoint.y floatValue]);
            CGContextStrokePath(context);
        }
    }
}

- (void) addVertical:(CGFloat)velocity
{
    // Keep pen on screen
    if ((self.penPosition.y + velocity) > self.frame.size.height) {
        self.penPosition = CGPointMake(self.penPosition.x, self.frame.size.height);
    }
    else if ((self.penPosition.y + velocity) < 0.0) {
        self.penPosition = CGPointMake(self.penPosition.x, 0.0);
    }
    
    // Save and move pen
    else if (self.penPosition.y <= self.frame.size.height && self.penPosition.y >= 0.0) {
        ObjPoint *point = [[ObjPoint alloc] init];
        point.x = [NSNumber numberWithFloat:self.penPosition.x];
        point.y = [NSNumber numberWithFloat:self.penPosition.y];
        [self.points addObject:point];
        self.penPosition = CGPointMake(self.penPosition.x, self.penPosition.y + velocity);
    }
}

- (void) addHorizontal:(CGFloat)velocity
{
    // Keep pen on screen
    if ((self.penPosition.x + velocity) > self.frame.size.width) {
        self.penPosition = CGPointMake(self.frame.size.width, self.penPosition.y);
        return;
    }
    else if ((self.penPosition.x + velocity) < 0.0) {
        self.penPosition = CGPointMake(0.0, self.penPosition.y);
        return;
    }
    
    // Save and move pen
    else if (self.penPosition.x <= self.frame.size.width && self.penPosition.x >= 0.0) {
        ObjPoint *point = [[ObjPoint alloc] init];
        point.x = [NSNumber numberWithFloat:self.penPosition.x];
        point.y = [NSNumber numberWithFloat:self.penPosition.y];
        [self.points addObject:point];
        self.penPosition = CGPointMake(self.penPosition.x + velocity, self.penPosition.y);
    }
}

- (void) clearScreen
{
    [self.points removeAllObjects];
    [self setNeedsDisplay];
}

@end