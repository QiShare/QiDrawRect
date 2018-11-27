//
//  SortViewController.m
//  QiDrawRect
//
//  Created by wangdacheng on 2018/11/14.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "SortViewController.h"
#import "SortAlgorithm.h"
#import "HeaderView.h"
#import "ZebraView.h"

#define Margin          5
#define HeaderHeight    30

@interface SortViewController () <HeaderViewDelegate>

@property (nonatomic, strong) HeaderView *headerView;
@property (nonatomic, strong) ZebraView *zebraView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SortViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setTitle:_sortName];
    
    [self layoutUI];
}

- (void)layoutUI {
    
    CGSize size = self.view.frame.size;
    _zebraView = [[ZebraView alloc] initWithFrame:CGRectMake(Margin, Margin, size.width - Margin*2, size.height - Margin*3 - HeaderHeight)];
    _zebraView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_zebraView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:_zebraView];
    
    _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(Margin, CGRectGetMaxY(_zebraView.frame) + Margin, size.width - Margin*2, HeaderHeight)];
    _headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    _headerView.delegate = self;
    [_headerView updateContentWithTime:0];
    [self.view addSubview:_headerView];
}

#pragma mark - HeaderViewDelegate
- (void)headerView:(HeaderView *)header buttonClicked:(UIButton *)button {
    
    if (button.tag == BtnType_Init) {
        CGFloat min = 10;
        CGFloat max = _zebraView.frame.size.height/2 - Space*2;
        NSInteger count = _zebraView.frame.size.width/(ItemWidth + ItemMargin);
        _dataArray = [SortAlgorithm getRandomArrWithCount:count min:min max:max];
        _zebraView.dataArr = _dataArray;
        [_zebraView setNeedsDisplay];
    }
    else {
        __weak typeof(self)wealSelf = self;
        switch (_sortType) {
            case SortType_Bubble: {
                [SortAlgorithm bubbleSortWithArr:_dataArray handler:^(NSInteger currentIdx, NSInteger dstIdx) {
                    wealSelf.zebraView.dataArr = wealSelf.dataArray;
                    wealSelf.zebraView.sortType = wealSelf.sortType;
                    wealSelf.zebraView.currentIdx = currentIdx;
                    wealSelf.zebraView.dstIdx = dstIdx;
                    [wealSelf.zebraView setNeedsDisplay];
                }];
                break;
            }
            case SortType_Select: {
                [SortAlgorithm selectSortWithArr:_dataArray handler:^(NSInteger currentIdx, NSInteger dstIdx) {
                    wealSelf.zebraView.dataArr = wealSelf.dataArray;
                    wealSelf.zebraView.sortType = wealSelf.sortType;
                    wealSelf.zebraView.currentIdx = currentIdx;
                    wealSelf.zebraView.dstIdx = dstIdx;
                    [wealSelf.zebraView setNeedsDisplay];
                }];
                break;
            }
            default:
                break;
        }
    }
}

@end
