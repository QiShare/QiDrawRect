//
//  ViewController.m
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/14.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "ViewController.h"
#import "TestDrawRectController.h"
#import "SortViewController.h"

#define Margin          10
#define ButtonHeight    40

@interface ViewController ()

@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTitle:@"QiDrawRect"];
    [self layoutUI];
}

- (void)layoutUI {
    
    CGFloat offset = 30;
    CGSize size = self.view.frame.size;
    _titleArr = @[@"测试DrawRect", @"冒泡排序", @"选择排序"];
    for (int i=0 ; i<_titleArr.count; i++) {
        UIButton *btn = [self createCustomButton:[_titleArr objectAtIndex:i]];
        btn.frame = CGRectMake(Margin, offset, size.width - Margin*2, ButtonHeight);
        btn.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:btn];
        btn.tag = 1000+i;
        offset += ButtonHeight + Margin;
    }
}

- (UIButton *)createCustomButton:(NSString *)title {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma Actions
- (void)buttonClicked:(UIButton *)button {
    
    if (button.tag == SortType_Test) {
        TestDrawRectController *testDrawRect = [[TestDrawRectController alloc] init];
        [self.navigationController pushViewController:testDrawRect animated:YES];
    } else {
        SortViewController *sortController = [[SortViewController alloc] init];
        sortController.sortType = button.tag;
        sortController.sortName = [_titleArr objectAtIndex:button.tag-1000];
        [self.navigationController pushViewController:sortController animated:YES];
    }
}

@end
