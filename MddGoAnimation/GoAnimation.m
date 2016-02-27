//
//  GoAnimation.m
//  TestUserPage
//
//  Created by szalarm on 16/1/7.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "GoAnimation.h"


@interface GoAnimation()
{
    //当前播放到哪个图层
    int playIndex;
    //是否结束
    BOOL isEnd;
}
//不可修改的事件
//事件
@property(nonatomic,strong) id targetEnd;
@property(nonatomic,assign)SEL actionEnd;
@end

@implementation GoAnimation
@synthesize mPageViewList=mData;
@synthesize IsNeedDispaly;
@synthesize mBaseView;

-(id)initWithDataPageList:(NSMutableArray *)pPageViewList mBaseView:(UIView *) pBaseView
{
    if (self=[super init]) {
        mData=pPageViewList;
        mBaseView=pBaseView;
        //默认值
        playIndex=0;
        isEnd=NO;
        //添加自带事件
        [self initDefNextEvent];
    }
    return self;
}

//初始化自带事件
-(void) initDefNextEvent
{
    if (mData) {
        for (GoAnimationItemView * itemView in mData) {
            [itemView addTargetAfter:self action:@selector(nextPage)];
        }
    }
}

-(void) setUpPage
{
    //如果需要播放
    if (IsNeedDispaly) {
        //如果没有结束
        if (!isEnd) {
            UIView * tNextView=[self getViewWithIndex:playIndex];
            [self putView:tNextView];
        }
    }

}
//下一页
-(void) nextPage
{
    //如果需要播放
    if (IsNeedDispaly) {
        //如果没有结束
        if (!isEnd) {
            //获取当前视图
            UIView * tCurrentView=[self getViewWithIndex:playIndex];
            [tCurrentView setHidden:YES];
            [tCurrentView removeFromSuperview];
            //放置下一张视图
            playIndex++;
            UIView * tNextView=[self getViewWithIndex:playIndex];
            [self putView:tNextView];
            //如果达到最大值
            if (playIndex==[self getGoAnimationCount]) {
                isEnd=YES;
            }
        //结束了
        }else
        {
            [self endPage];
        }
    //结束
    }else{
        [self endPage];
    }
}
//结束
-(void) endPage
{
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.targetEnd performSelector:self.actionEnd withObject:self];
    #pragma clang diagnostic pop


}

-(void)addEndTarget:(id)pTarget action:(SEL)pAction
{
    self.targetEnd=pTarget;
    self.actionEnd=pAction;
}
//放置视图
-(void) putView:(UIView *) pView
{
    [mBaseView addSubview:pView];
    [pView setHidden:NO];
    //放到最上方
    [mBaseView bringSubviewToFront:pView];
}

//获取当前视图
-(GoAnimationItemView *) getViewWithIndex:(int) pIndex
{
    GoAnimationItemView * rView=nil;
    //范围内
    if (mData&&pIndex<=[mData count]-1) {
        rView= [mData objectAtIndex:pIndex];
    }
    return rView;
}
//获取数组大小
-(int) getGoAnimationCount
{
    int rCount=0;
    if (mData) {
        rCount=[mData count];
    }
    return rCount;
}



@end
