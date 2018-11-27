//
//  HeaderView.h
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/16.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BtnType) {
    BtnType_Init = 100,
    BtnType_Start,
};

@class HeaderView;

@protocol HeaderViewDelegate <NSObject>

- (void)headerView:(HeaderView *)header buttonClicked:(UIButton *)button;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : UIView

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

- (void)updateContentWithTime:(NSInteger)seconds;

@end

NS_ASSUME_NONNULL_END
