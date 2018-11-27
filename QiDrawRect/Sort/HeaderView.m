//
//  HeaderView.m
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/16.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "HeaderView.h"

#define Margin  5

@interface HeaderView ()

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *initbutton;
@property (nonatomic, strong) UIButton *startbutton;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
        _line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [_line setBackgroundColor:[UIColor grayColor]];
        [self addSubview:_line];
        
//        _timeLabel = [[UILabel alloc] init];
//        [_timeLabel setFont:[UIFont systemFontOfSize:14]];
//        [_timeLabel setText:@"排序时间："];
//        [self addSubview:_timeLabel];
        
        _initbutton = [UIButton buttonWithType:UIButtonTypeSystem];
        _initbutton.frame = CGRectMake(0, 0, 50, 30);
        _initbutton.tag = BtnType_Init;
        [_initbutton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_initbutton setTitle:@"初始化" forState:UIControlStateNormal];
        [_initbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_initbutton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_initbutton];
        
        _startbutton = [UIButton buttonWithType:UIButtonTypeSystem];
        _startbutton.frame = CGRectMake(0, 0, 60, 30);
        _startbutton.tag = BtnType_Start;
        [_startbutton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_startbutton setTitle:@"开始排序" forState:UIControlStateNormal];
        [_startbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_startbutton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_startbutton];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    _startbutton.center = CGPointMake(size.width-Margin-_startbutton.frame.size.width/2, size.height/2);
    _initbutton.center = CGPointMake(CGRectGetMinX(_startbutton.frame)-_initbutton.frame.size.width/2, size.height/2);
    _timeLabel.center = CGPointMake(Margin+_timeLabel.frame.size.width/2, size.height/2);
    _line.center = CGPointMake(size.width/2, size.height-0.5);
}

- (void)updateContentWithTime:(NSInteger)seconds {
    
    [_timeLabel setText:[NSString stringWithFormat:@"排序时间：%ld", (long)seconds]];
    [_timeLabel sizeToFit];
    [self setNeedsLayout];
}

#pragma mark - Actions
- (void)buttonClicked:(UIButton *)button {
    
    if (_delegate && [_delegate respondsToSelector:@selector(headerView:buttonClicked:)]) {
        [_delegate headerView:self buttonClicked:button];
    }
}

@end
