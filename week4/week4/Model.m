//
//  Model.m
//  week4
//
//  Created by sunsidew on 2014. 8. 3..
//  Copyright (c) 2014년 sunsidew. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void) randomize
{
//    srandom(time(NULL));
//    int number = (random() % 3);
//    --> sec 단위 랜덤 : (x)

    int number = (arc4random() % 3);
    
    NSArray* imagename = [NSArray arrayWithObjects:@"rock.jpg", @"paper.jpg", @"scissor.png", nil];
    NSArray* randomnum = [NSArray arrayWithObjects:
                          [NSNumber numberWithInt:0],
                          [NSNumber numberWithInt:1],
                          [NSNumber numberWithInt:2],nil];
    
    NSNotificationCenter *NC = [NSNotificationCenter defaultCenter];
    NSDictionary* imagemap = [NSDictionary dictionaryWithObjects:imagename forKeys:randomnum];
    NSDictionary* result = [NSDictionary dictionaryWithObject:imagemap[[NSNumber numberWithInt:number]]
                                                       forKey:@"imagepath"];
    
    [NC postNotificationName:@"shakeshake" object:self userInfo:result];
}

@end
