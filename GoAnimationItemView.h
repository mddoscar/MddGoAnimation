//
//  GoAnimationItemView.h
//  TestUserPage
//
//  Created by szalarm on 16/1/7.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

//按钮
#import "GoAnimationItemImageView.h"
/*
 引导项目
 */
@interface GoAnimationItemView : UIView

#pragma mark 界面
//高亮透明区域
@property(nonatomic,strong) GoAnimationItemImageView * mUiHightLightView;
//跟随箭头
@property(nonatomic,strong) UIImageView * mUiFlowImageView;
//跟随文字
@property(nonatomic,strong) UILabel * mUiFlowLabel;
//跟随按钮
@property(nonatomic,strong) UIButton * mUiFlowButton;
//背景颜色
@property(nonatomic,strong) UIColor * mBackColor;
//透明度
@property(nonatomic,assign) float mAlpha;
//设置事件
#pragma mark 事件
-(void)addTarget:(id)target action:(SEL)action;
-(void)addTargetAfter:(id)targetAfter action:(SEL)actionAfter;

#pragma mark cotr
//跟随文字
-(id) initWithDataItemImageView:(GoAnimationItemImageView *)pUiHightLightView
               mUiFlowImageView:(UIImageView *)pUiFlowImageView mBackColor:(UIColor *)pBackColor mAlpha:(float)pAlpha mRect:(CGRect) pRect;
//跟随文字
-(id) initWithDataItemImageView:(GoAnimationItemImageView *)pUiHightLightView
               mUiFlowImageView:(UIImageView *)pUiFlowImageView  mUiFlowLabel:(UILabel *)pUiFlowLabel mUiFlowButton:(UIButton *)pUiFlowButton  mBackColor:(UIColor *)pBackColor mAlpha:(float)pAlpha mRect:(CGRect) pRect;

@end
