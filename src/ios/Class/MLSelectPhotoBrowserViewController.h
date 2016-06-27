//  github: https://github.com/MakeZL/MLSelectPhoto
//  author: @email <120886865@qq.com>
//
//  MLSelectPhotoBrowserViewController.h
//  MLSelectPhoto
//
//  Created by 张磊 on 15/4/23.
//  Copyright (c) 2015年 com.zixue101.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDHeader.h"
typedef void(^deleteCallBackBlock)();

@interface MLSelectPhotoBrowserViewController : UIViewController
// 展示的图片 MLSelectAssets
@property (strong,nonatomic) NSArray *photos;

@property (strong,nonatomic) NSMutableArray *mlLeftselectedArr;
@property (strong,nonatomic) NSMutableArray *mlRightselectedArr;
@property (strong,nonatomic) NSMutableArray *selectedModelArr;
// 当前提供的分页数
@property (nonatomic , assign) NSInteger currentPage;
@property (nonatomic , assign) NSInteger leftCount;
@property (nonatomic , assign) NSInteger rightCount;
// 当前提供的分页数
@property (nonatomic , assign) BOOL isModelData;

@property (nonatomic , copy) deleteCallBackBlock deleteCallBack;
@end
