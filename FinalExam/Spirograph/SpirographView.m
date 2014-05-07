//
//  SpirographView.m
//  Spirograph
//
//  Created by Ryan on 2/23/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographView.h"

@implementation SpirographView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.k = 0.5;
        self.l = 0.5;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    CGFloat t=0.0;
    
    t=0;
    [bz moveToPoint:[self sCurve:t l:self.l k:self.k]];
    for (t=0; t<self.numSteps*self.stepSize; t=t+self.stepSize) {
        [bz addLineToPoint:[self sCurve:t l:self.l k:self.k]];
    }
    [bz stroke];
    [self setBackgroundColor:[UIColor yellowColor]];

    
    [[NSString stringWithFormat:@"l = %.2f, k = %.2f",self.l, self.k] drawAtPoint:CGPointMake(20, 260) withAttributes:nil];
    
}

- (CGPoint) sCurve:(CGFloat)t l:(CGFloat)l k:(CGFloat)k {
    
    return CGPointMake(140+120*((1-k)*cos(t)+l*k*cos(((1-k)/k)*t)), 140+120*((1-k)*sin(t)-l*k*sin(((1-k)/k)*t)));
}

@end
