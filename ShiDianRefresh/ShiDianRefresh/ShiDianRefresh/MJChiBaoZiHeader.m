//
//  MJChiBaoZiHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/12.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "MJChiBaoZiHeader.h"
#import "UIImage+ShiDianRefresh.h"

@implementation MJChiBaoZiHeader
#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    UIColor *c = [UIColor colorWithRed:241/255. green:90/255. blue:90/255. alpha:1];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=74; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ShiDianRefresh.bundle/dropdown_anim_000%zd", i]];

        image = [image tintColor:c];
        image = [image remakeImageWithScale:0.8 tintColor:c];
        [idleImages addObject:image];
    }
     [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=108; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ShiDianRefresh.bundle/dropdown_loading_0%zd", i]];
        image = [image tintColor:c];
        image = [image remakeImageWithScale:0.8 tintColor:c];
     
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}
@end
