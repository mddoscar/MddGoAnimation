//
//  GoAnimation.h
//  TestUserPage
//
//  Created by szalarm on 16/1/7.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <Foundation/Foundation.h>

//引用uikit
#import <UIKit/UIKit.h>
//引用
#import "GoAnimationItemView.h"
#import "GoAnimationItemImageView.h"
/*
 引导动画
 //例子
 GoAnimationItemImageView * tImage=[GoAnimationItemImageView initializeForNib];
 //视图
 UIImageView * tImageFlow=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goinfo"]];
 //数组
 
 //子项
 GoAnimationItemView *tItemView=[[GoAnimationItemView alloc] initWithDataItemImageView:tImage mUiFlowImageView:tImageFlow mBackColor:[UIColor grayColor] mAlpha:0.5 mRect:self.view.frame];
 
 NSMutableArray * tViewList=[NSMutableArray array];
 [tViewList addObject:tItemView];
 
 //动画
 GoAnimation * goAnimation=[[GoAnimation alloc] initWithDataPageList:tViewList mBaseView:self.view];
 goAnimation.IsNeedDispaly=YES;
 //动画事件
 [tItemView addTarget:self action:@selector(doMessage)];
 
 
 [goAnimation setUpPage];
 
 
 */
@interface GoAnimation : NSObject

#pragma mark 页面
//页面
@property (nonatomic ,strong) NSMutableArray * mPageViewList;
//基视图
@property (nonatomic,strong) UIView * mBaseView;
#pragma mark 数据
//是否要显示
@property (nonatomic,assign) BOOL IsNeedDispaly;
#pragma mark 初始化

//(页面,基视图)
-(id) initWithDataPageList:(NSMutableArray *)pPageViewList mBaseView:(UIView *) pBaseView;

//下一张
-(void) setUpPage;
-(void) nextPage;
-(void) endPage;
//结束事件
-(void)addEndTarget:(id)pTarget action:(SEL)pAction;

@end
