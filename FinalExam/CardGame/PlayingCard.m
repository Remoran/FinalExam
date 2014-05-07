//
//  PlayingCard.m
//  Test1b
//
//  Created by Ryan on 2/27/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (PlayingCard *otherCard in otherCards) {
        if (otherCard.rank == self.rank) {
            score += 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score += 1;
        }
    }
    
    NSMutableArray *otherCardsCollectionForComparison = [otherCards mutableCopy];
    for (PlayingCard *otherCard in otherCards) {
        [otherCardsCollectionForComparison removeObject:otherCard];
        for (PlayingCard *otherCardInOtherCardsColleciton in otherCardsCollectionForComparison) {
            if (otherCard.rank == otherCardInOtherCardsColleciton.rank) {
                score += 4;
            } else if ([otherCard.suit isEqualToString:otherCardInOtherCardsColleciton.suit]) {
                score += 1;
            }
        }
    }
    
    return score;
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♥", @"♦", @"♣", @"♠"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
             @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
