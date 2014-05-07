//
//  Deck.h
//  Test1b
//
//  Created by Ryan on 2/27/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
