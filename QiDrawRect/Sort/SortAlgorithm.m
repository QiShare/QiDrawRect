//
//  BubbleSortModel.m
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/15.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "SortAlgorithm.h"

@interface SortAlgorithm ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation SortAlgorithm

+ (NSMutableArray *)getRandomArrWithCount:(NSInteger)count min:(NSInteger)min max:(NSInteger)max {
    
    NSMutableArray *mutArr = [NSMutableArray array];
    while (count) {
        NSInteger random = arc4random() % (max - min + 1) + min;
        [mutArr addObject:@(random)];
        count--;
    }
    return mutArr;
}

+ (void)bubbleSortWithArr:(NSMutableArray *)dataArr handler:(void (^)(NSInteger, NSInteger))handler {
    
    dispatch_async(dispatch_queue_create(DISPATCH_QUEUE_SERIAL, nil), ^{
        for (int i=0; i < dataArr.count; i++) {
            for (int j=0; j < dataArr.count-1-i; j++) {
                if ([dataArr[j] integerValue] > [dataArr[j+1] integerValue]) {
                    [dataArr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler(j, j+1);
                });
                [NSThread sleepForTimeInterval:0.5];
            }
        }
    });
}

+ (void)selectSortWithArr:(NSMutableArray *)dataArr handler:(void (^)(NSInteger, NSInteger))handler {
    
    dispatch_async(dispatch_queue_create(DISPATCH_QUEUE_SERIAL, nil), ^{
        for (int i=0; i < dataArr.count; i++) {
            for (int j=i+1; j < dataArr.count; j++) {
                if ([dataArr[i] integerValue] > [dataArr[j] integerValue]) {
                    [dataArr exchangeObjectAtIndex:i withObjectAtIndex:j];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler(i, j);
                });
                [NSThread sleepForTimeInterval:0.5];
            }
        }
    });
}

@end
