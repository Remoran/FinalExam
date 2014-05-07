//
//  DrawView.h
//  Quiz8
//
//  Created by Ryan on 4/14/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView

@property (strong,nonatomic) NSMutableArray *points;
@property (nonatomic) CGPoint penPosition;
@property (nonatomic) BOOL penPositionIsSet;

- (void) addVertical:(CGFloat)velocity;
- (void) addHorizontal:(CGFloat)velocity;
- (void) clearScreen;

@end
