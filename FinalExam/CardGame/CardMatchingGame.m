//
//  CardMatchingGame.m
//  Test1b
//
//  Created by Ryan on 2/27/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "CardMatchingGame.h"

static const int mismatchPenalty = 2;
static const int correctMatchPoints = 4;
static const int choosePenalty = 1;

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) NSInteger currentMatchCardFlipCount;

@end

@implementation CardMatchingGame

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            NSMutableArray *currentChosenCards = [[NSMutableArray alloc] init];
            NSMutableString *statusCurrentChosenCards = [[NSMutableString alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [currentChosenCards addObject:otherCard];
                    [statusCurrentChosenCards appendFormat:@"%@ ", otherCard.contents];
                }
            }
            // Last clicked card doesn't count so compare to 1
            if ([currentChosenCards count] == 1) {
                int matchScore = [card match:currentChosenCards];
                if (matchScore) {
                    self.score += matchScore * correctMatchPoints;
                    for (Card *otherCard in currentChosenCards) {
                        otherCard.matched = YES;
                    }
                    card.matched = YES;
                } else {
                    self.score -= mismatchPenalty;
                    for (Card *otherCard in currentChosenCards) {
                        otherCard.chosen = NO;
                    }
                }
            }
            self.score -= choosePenalty;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil ;
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

@end
