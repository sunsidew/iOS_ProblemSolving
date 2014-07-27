//
//  puzzleBoard.h
//  week3
//
//  Created by sunsidew on 2014. 7. 24..
//  Copyright (c) 2014년 sunsidew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface puzzleBoard : NSObject {
    int size;
    int movecount;
    int x;
    int y;
    NSMutableArray* board;
}

- (int) size;
- (int) movecount;
- (int) x;
- (int) y;
- (NSMutableArray*) board;

- (void) MYStatusBoard;
- (BOOL) MYNumberMatch;
- (void) MYBoardShuffle;
- (BOOL) MYMoveNumber:(char) movepos;

@end
