//
//  GoAnimationItemImageView.m
//  TestUserPage
//
//  Created by szalarm on 16/1/7.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "GoAnimationItemImageView.h"
/*
 点击
 */
@interface GoAnimationItemImageView()
{
}
#pragma mark 初始大小
//初始大小(私有变量)
@property (nonatomic) CGRect imageRawFrameView;
@end
@implementation GoAnimationItemImageView

-(id) initWithImage:(UIImage *)image{
    
    NSLog(@"initWithImage----->");
    return self;
}

-(id) initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage{
    
    NSLog(@"initWithImage---->");
    return self;
}

-(void) drawRect:(CGRect)rect{
    //CGPointMake(CricleCenterX , CricleCenterY)
    //    NSLog(@"%f",self.frame.origin.x);
    
    float Radus= self.frame.size.width/2;
    //用bezier曲线画遮罩层
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter: CGPointMake(self.center.x-self.frame.origin.x, self.center.y-self.frame.origin.y) radius:Radus startAngle:0 endAngle:2*M_PI clockwise:YES];
    CAShapeLayer *shape=[CAShapeLayer layer];
    shape.path=path.CGPath;
    self.layer.mask=shape;
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
    return self;
}
//添加事件
- (void)addTarget:(id)target action:(SEL)action{
    self.target=target;
    self.action=action;
}
-(void)addTargetAfter:(id)targetAfter action:(SEL)actionAfter
{
    self.targetAfter=targetAfter;
    self.actionAfter=actionAfter;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // [super touchesBegan:touches withEvent:event];
    NSLog(@"touches Begin");
    //缓存默认大小
    [self setRawFrame:self.frame];
    //默认大小
    self.imageFrameView=[self getRawFrame];//self.frame;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame=CGRectMake(self.frame.origin.x-5, self.frame.origin.y-5, self.frame.size.width+10, self.frame.size.height+10);
        
    }];
    //[UIView commitAnimations];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches ended begin");
    
    [UIView animateWithDuration:0.5 animations:^{
        //还原默认值
        self.frame=[self getRawFrame];//self.imageFrameView;
    } completion:^(BOOL finished) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.action withObject:self];
        [self.targetAfter performSelector:self.actionAfter withObject:self];
#pragma clang diagnostic pop
    }];
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
//初始阿虎
+ (instancetype)initializeForNib{
    GoAnimationItemImageView *view = [[[NSBundle mainBundle]loadNibNamed:@"GoAnimationItemImageView" owner:nil options:nil]lastObject];
    //NSStringFromClass([self class])
    return view;
}
#pragma mark 设置大小
//只赋值一次
-(void) setRawFrame:(CGRect )pFrame
{
    CGPoint oldOrign=self.imageRawFrameView.origin;
    CGSize oldSize=self.imageRawFrameView.size;
    //如果是默认0,才赋值
    if (((int)oldSize.width==0)&&((int)oldSize.height==0)&&((int)oldOrign.x==0)&&((int)oldOrign.y==0)) {
        self.imageRawFrameView=pFrame;
    }
}
//取值
-(CGRect) getRawFrame
{
    return self.imageRawFrameView;
}




@end
