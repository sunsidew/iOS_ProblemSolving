//
//  main.m
//  week3
//
//  Created by sunsidew on 2014. 7. 24..
//  Copyright (c) 2014년 sunsidew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "puzzleBoard.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        puzzleBoard* board = [[puzzleBoard alloc] init:3];
        
        NSLog(@"[Before]");
        [board MYStatusBoard];
        
        //번호 순서 매칭 비교 메서드
        if ([board MYNumberMatch] == YES) {
            NSLog(@"correct!");
        } else {
            NSLog(@"not correct!");
        }
        
        // 숫자 섞기
        [board MYBoardShuffle];

        NSLog(@"[After]");
        [board MYStatusBoard];
        
        if ([board MYNumberMatch] == YES) {
            NSLog(@"correct!");
        } else {
            NSLog(@"not correct!");
        }

        if([board MYMoveNumber:'a']) {
            [board MYStatusBoard];
        }
        if([board MYMoveNumber:'w']) {
            [board MYStatusBoard];
        }
        if([board MYMoveNumber:'s']) {
            [board MYStatusBoard];
        }
        if([board MYMoveNumber:'x']) {
            [board MYStatusBoard];
        }
        
        /*
         undo/redo를 하려면, N x N Array에 왔던 방향을 기록하는 방식으로 현재 비어있는 칸으로부터 앞/뒤방향 모두 탐색 할 수 있게끔 기록을 남길 수 있고, 만약 undo/redo를 N x N 개 이상 기록하고 싶을 경우 해당하는 공간 크기만큼 history Array를 추가적으로 사용하는 방법이 있다. 
         
            ex1) [ ] [w] [s]
                 [ ] [s] [x]
                 [ ] [a] [x]
         
            현재 빈 칸이 (2, 1)이라고 할때 MYMoveNumber메서드에서 칸 이동이 이루어질때 기록한(ex1) 방향의 반대 방향으로 쫓아올라가면 칸 이동을 추적할 수 있는 것이다(ex2).
         */
        
        [board release];
        
    }
    return 0;
}

