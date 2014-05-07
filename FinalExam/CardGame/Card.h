//
//  Card.h
//  Test1b
//
//  Created by Ryan on 2/27/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end