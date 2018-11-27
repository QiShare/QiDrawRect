//
//  ZebraView.m
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/15.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "ZebraView.h"

@interface ZebraView ()

@end

@implementation ZebraView

- (void)drawRect:(CGRect)rect {
    
    CGSize size = rect.size;
    
    for (int i=0; i<_dataArr.count; i++) {
        // 获取上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        // 设置填充色、文字颜色
        CGContextSetRGBFillColor(context, 0.2, 0.5, 0.8, 1.0);
        UIColor *color = [UIColor whiteColor];
        if (i == _currentIdx) {
            CGContextSetRGBFillColor(context, 0, 1, 0, 1.0);
            color = [UIColor greenColor];
        }
        else if (i == _dstIdx) {
            CGContextSetRGBFillColor(context, 1, 0, 0, 1.0);
            color = [UIColor redColor];
        }
        
        // 画柱状图
        CGContextSetLineWidth(context, 2.0);
        CGFloat itemHeight = [_dataArr[i] integerValue];
        CGContextFillRect(context, CGRectMake((ItemMargin + ItemWidth) * i, size.height/2 - itemHeight - Space, ItemWidth, itemHeight));
        
        // 画文字
        UIFont *font = [UIFont boldSystemFontOfSize:6];
        NSString *text = [NSString stringWithFormat:@"%@", _dataArr[i]];
        [text drawInRect:CGRectMake((ItemMargin + ItemWidth) * i, size.height/2 - Space, ItemWidth, itemHeight)
          withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color}];
    }
}

@end
