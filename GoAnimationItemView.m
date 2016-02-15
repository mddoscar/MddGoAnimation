//
//  GoAnimationItemView.m
//  TestUserPage
//
//  Created by szalarm on 16/1/7.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "GoAnimationItemView.h"

//文本默认大小
//屏幕高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
//屏幕宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kLabelWith (kScreenWidth )*2/3
#define kLabelHeight 50
#define kButtonWith (kScreenWidth )*2/3
#define kButtonHeight 40

@implementation GoAnimationItemView
//视图
@synthesize mUiHightLightView;
@synthesize mUiFlowImageView;
@synthesize mUiFlowLabel;
@synthesize mUiFlowButton;
@synthesize mAlpha;
@synthesize mBackColor;

-(void) drawRect:(CGRect)rect{
    //CGPointMake(CricleCenterX , CricleCenterY)
    //    NSLog(@"%f",self.frame.origin.x);
    
//    float Radus= self.frame.size.width/2;
    //用bezier曲线画遮罩层
//    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter: CGPointMake(self.center.x-self.frame.origin.x, self.center.y-self.frame.origin.y) radius:Radus startAngle:0 endAngle:2*M_PI clockwise:YES];
//    CAShapeLayer *shape=[CAShapeLayer layer];
//    shape.path=path.CGPath;
//    self.layer.mask=shape;
    //[self.image drawInRect:rect blendMode:kCGBlendModeExclusion alpha:0.5f];
    
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    //NSLog(@"initWithCoder 自定义图标------>");
    //NSLog(@"插桩A");
    if(self=[super initWithCoder:aDecoder]){
        //NSLog(@"插桩B");
        self.userInteractionEnabled=YES;
        
        self.layer.borderWidth=1.0;
        //        self.layer.borderColor=[UIColor colorWithWhite:0.5 alpha:0.8].CGColor;
        self.clipsToBounds=YES;
        //边框
        self.layer.cornerRadius= self.frame.size.width/2+1;
        self.layer.borderColor=[UIColor colorWithWhite:0.5 alpha:0.1].CGColor;
        //        self.layer.cornerRadius=5;
        self.layer.backgroundColor=[[UIColor clearColor]CGColor];
        //自定义绘图
        [self drawRect:self.frame];
        //NSLog(@"插桩D");
        
    }
    return  self;
}

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"initWithFrame----->");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self doMoveFlowImage];
        
    }
    return self;
}

-(id) initWithDataItemImageView:(GoAnimationItemImageView *)pUiHightLightView
               mUiFlowImageView:(UIImageView *)pUiFlowImageView mBackColor:(UIColor *)pBackColor mAlpha:(float)pAlpha mRect:(CGRect) pRect
{

    if (self=[super init]) {
        self.mUiHightLightView=pUiHightLightView;
        self.mUiFlowImageView=pUiFlowImageView;
        self.mBackColor=pBackColor;
        self.mAlpha=pAlpha;
        //本身视图
        self.frame=pRect;
        //添加子视图
        [self addSubview:self.mUiHightLightView];
        [self addSubview:self.mUiFlowImageView];
        //挪位置
        [self doMoveFlowImage];
        //设置背景颜色
        self.backgroundColor=[[self mBackColor] colorWithAlphaComponent:self.mAlpha];
        //局部透明
        self.mUiHightLightView.backgroundColor=[[UIColor clearColor] colorWithAlphaComponent:0.2];
//        [self setAlpha:self.mAlpha];
    }
    
    return self;

}

//冲定义跟随文字
-(id) initWithDataItemImageView:(GoAnimationItemImageView *)pUiHightLightView
               mUiFlowImageView:(UIImageView *)pUiFlowImageView  mUiFlowLabel:(UILabel *)pUiFlowLabel mUiFlowButton:(UIButton *)pUiFlowButton  mBackColor:(UIColor *)pBackColor mAlpha:(float)pAlpha mRect:(CGRect) pRect
{
    if (self=[super init]) {
        self.mUiHightLightView=pUiHightLightView;
        self.mUiFlowImageView=pUiFlowImageView;
        self.mUiFlowLabel=pUiFlowLabel;
        self.mUiFlowButton=pUiFlowButton;
        self.mBackColor=pBackColor;
        self.mAlpha=pAlpha;
        //本身视图
        self.frame=pRect;
        //添加子视图
        [self addSubview:self.mUiHightLightView];
        [self addSubview:self.mUiFlowImageView];
        //如果文字不为空
        if (nil!=self.mUiFlowLabel) {
             [self addSubview:self.mUiFlowLabel];
            //换行
            self.mUiFlowLabel.numberOfLines=2;
        }
        //如果按钮不为空
        if(nil!=self.mUiFlowButton)
        {
            [self addSubview:self.mUiFlowButton];
        }
        //挪位置
        [self doMoveFlowImage];
        //设置背景颜色
        self.backgroundColor=[[self mBackColor] colorWithAlphaComponent:self.mAlpha];
        //局部透明
        self.mUiHightLightView.backgroundColor=[[UIColor clearColor] colorWithAlphaComponent:0.2];
        //        [self setAlpha:self.mAlpha];
    }
    
    return self;

}


//移动图片
-(void) doMoveFlowImage
{
    //获取图片的右下角
    if (self.mUiFlowImageView) {
        
    }else
    {
        //跟随图片
        self.mUiFlowImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mddgoinfo"]];
    }
    //移动位置
    CGRect tBaseFrame=self.mUiHightLightView.frame;
    //获取右下角
    CGPoint rightPoint=CGPointMake(tBaseFrame.origin.x+tBaseFrame.size.width,tBaseFrame.origin.y+tBaseFrame.size.height);
    CGRect tFlowFrame=self.mUiFlowImageView.frame;
    tFlowFrame.origin.x=rightPoint.x;
    tFlowFrame.origin.y=rightPoint.y;
    //重新赋值
    self.mUiFlowImageView.frame=tFlowFrame;
    //添加跟随文字
    if (nil!=self.mUiFlowLabel) {
        
        CGRect tFlowLabelFrame=CGRectMake(self.mUiFlowImageView.center.x, tFlowFrame.origin.y+tFlowFrame.size.height, kLabelWith, kLabelHeight);
        self.mUiFlowLabel.frame=tFlowLabelFrame;
        //居中
        self.mUiFlowLabel.center=self.center;
        self.mUiFlowLabel.frame=CGRectMake(self.mUiFlowLabel.frame.origin.x, tFlowFrame.origin.y+tFlowFrame.size.height, self.mUiFlowLabel.frame.size.width, self.mUiFlowLabel.frame.size.height);

        //按钮
        if (nil!=self.mUiFlowButton) {
            CGRect tFlowButtonFrame=CGRectMake(self.mUiFlowImageView.center.x, tFlowLabelFrame.origin.y+tFlowLabelFrame.size.height, kButtonWith, kButtonHeight);
            self.mUiFlowButton.frame=tFlowButtonFrame;
            //居中
            self.mUiFlowButton.center=self.center;
            self.mUiFlowButton.frame=CGRectMake(self.mUiFlowButton.frame.origin.x, tFlowLabelFrame.origin.y+tFlowLabelFrame.size.height, self.mUiFlowButton.frame.size.width, self.mUiFlowButton.frame.size.height);
        }
    }
    
    
}


-(void)addTarget:(id)target action:(SEL)action
{
    [self.mUiHightLightView addTarget:target action:action];
}
-(void)addTargetAfter:(id)targetAfter action:(SEL)actionAfter
{
    [self.mUiHightLightView addTargetAfter:targetAfter action:actionAfter];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
