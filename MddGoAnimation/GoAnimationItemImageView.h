//
//  GoAnimationItemImageView.h
//  TestUserPage
//
//  Created by szalarm on 16/1/7.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 带点击事件图片
 */
@interface GoAnimationItemImageView : UIImageView
@property (nonatomic) CGRect imageFrameView;

//事件
@property(nonatomic) id target;
@property(nonatomic)SEL action;
//之后
@property(nonatomic) id targetAfter;
@property(nonatomic)SEL actionAfter;
//@property(nonatomic,)
-(void)addTarget:(id)target action:(SEL)action;
#pragma mark 这个事件不要添加，是ItemView自动覆盖的
-(void)addTargetAfter:(id)targetAfter action:(SEL)actionAfter;


#pragma mark 从xib初始化
+ (instancetype)initializeForNib;

@end
