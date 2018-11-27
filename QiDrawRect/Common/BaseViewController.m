//
//  BaseViewController.m
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/14.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (self.navigationController.topViewController && self.navigationController.viewControllers.firstObject != self) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navbar_icon_return"] style:UIBarButtonItemStylePlain target:self action:@selector(backBarBtnClicked:)];
        self.navigationItem.leftBarButtonItem = backItem;
    }
}

#pragma mark - Action functions
- (void)backBarBtnClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

@end
