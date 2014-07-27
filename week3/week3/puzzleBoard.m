//
//  puzzleBoard.m
//  week3
//
//  Created by sunsidew on 2014. 7. 24..
//  Copyright (c) 2014년 sunsidew. All rights reserved.
//

#import "puzzleBoard.h"

@implementation puzzleBoard

- (id) init:(int) arraysize {
    if (self = [super init]) {
        size = arraysize;
        movecount = 0;
        board = [[NSMutableArray alloc] init];

        for(int i = 0 ; i < size ; i++) {
            for(int j = 0 ; j < size ; j++) {
                int idx = i*size + j;
                [board addObject:[NSNumber numberWithInt:idx+1]];
            }
        }
        board[(size * size)- 1] = [NSNumber numberWithInt:0];
        
        x = size-1;
        y = size-1;
    }
    return self;
}

- (void) MYStatusBoard {
    NSLog(@"------");
    for(int i = 0 ; i < size ; i++) {
        NSMutableString* temp = [[NSMutableString alloc] init];

        for(int j = 0 ; j < size ; j++) {
            int idx = i*size + j;
            
            if (board[idx] == [NSNumber numberWithInt:0]) {
                [temp appendString:@" "];
            } else {
                [temp appendString:[board[idx] stringValue]];
            }
            [temp appendString:@" "];
        }
        NSLog(@"%@\n",temp);
        
        [temp release];
    }
    NSLog(@"------");
    NSLog(@"moved : %d",movecount);
    NSLog(@"------");
}

- (BOOL) MYNumberMatch {
    for(int i = 0 ; i < size ; i++) {
        for(int j = 0 ; j < size-1 ; j++) {
            int idx = i*size + j;
            
            if ([NSNumber numberWithInt:idx+1] != board[idx]) {
                return NO;
            }
        }
    }
    return YES;
}

- (void) MYBoardShuffle {
    srandom(time(NULL));
    for(int i = 0 ; i < size ; i++) {
        for(int j = 0 ; j < size ; j++) {
            int idx = i*size + j;
            int rnd = (random() % (size*size));
            NSNumber* temp;
            
            temp = board[idx];
            board[idx] = board[rnd];
            board[rnd] = temp;
            
            if([NSNumber numberWithInt:0] == board[rnd]) {
                y = rnd/3;
                x = rnd%3;
            } else if([NSNumber numberWithInt:0] == board[idx]) {
                y = idx/3;
                x = idx%3;
            }
            
            [temp release];
        }
    }
}

- (BOOL) MYMoveNumber:(char) movepos {
    int dx = 0;
    int dy = 0;
    
    if (movepos == 'a') {
        dx = -1;
    } else if (movepos == 's') {
        dx = 1;
    } else if (movepos == 'w') {
        dy = -1;
    } else if (movepos == 'x') {
        dy = 1;
    }
    
    if((dx+x) >= size || (dy+y) >= size || (dx+x) < 0 || (dy+y) < 0) {
        NSLog(@"Out of area!");
        return NO;
    } else {
        int idx;
        int chg_num;
        
        movecount++;
        idx = y*size + x;
        y = dy+y;
        x = dx+x;
        chg_num = y*size + x;
        
        NSNumber* temp;
        
        temp = board[idx];
        board[idx] = board[chg_num];
        board[chg_num] = temp;
        
        [temp release];
        
        return YES;
    }
}

@end
