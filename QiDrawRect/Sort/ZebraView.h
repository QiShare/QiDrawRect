//
//  ZebraView.h
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/15.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Space       15
#define ItemMargin  10
#define ItemWidth   40

NS_ASSUME_NONNULL_BEGIN

@interface ZebraView : UIView

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, assign) SortType sortType;
@property (nonatomic, assign) NSInteger currentIdx;
@property (nonatomic, assign) NSInteger dstIdx;
@property (nonatomic, assign) NSNumber *currentItem;

@end

NS_ASSUME_NONNULL_END
