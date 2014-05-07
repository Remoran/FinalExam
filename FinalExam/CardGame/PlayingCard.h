//
//  PlayingCard.h
//  Test1b
//
//  Created by Ryan on 2/27/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
