//
//  TestDrawRectController.m
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/14.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "TestDrawRectController.h"
#import "LittleManView.h"
#import "TestView.h"

#define Margin      15

@interface TestDrawRectController ()

@end

@implementation TestDrawRectController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTitle:@"TestDrawRect"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self layoutUI];
}

- (void)layoutUI {
    
    CGSize size = self.view.frame.size;
    LittleManView *littleMan = [[LittleManView alloc] initWithFrame:CGRectMake(Margin, Margin, size.width - Margin * 2, size.height - Margin * 2)];
    littleMan.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:littleMan];
    
    // border 是往view里面扩张的
    [littleMan.layer setBorderColor:[UIColor blueColor].CGColor];
    [littleMan.layer setBorderWidth:1.0];
}

//- (void)layoutUI {
//
//    CGSize size = self.view.frame.size;
//    TestView *testView = [[TestView alloc] initWithFrame:CGRectMake(Margin, Margin, size.width - Margin * 2, size.height - Margin * 2)];
//    testView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    //[testView setBackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:testView];
//
//    // border 是往view里面扩张的
//    [testView.layer setBorderColor:[UIColor blueColor].CGColor];
//    [testView.layer setBorderWidth:1.0];
//}

@end
