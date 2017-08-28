//
//  DYAnimationVC.m
//  DYLottieDemo
//
//  Created by DanielYK on 2017/8/22.
//  Copyright © 2017年 DanielYK. All rights reserved.
//

#import "DYAnimationVC.h"
#import <lottie-ios/Lottie/Lottie.h>

@interface DYAnimationVC ()
{
    NSString        *jsonStr;
    UIBarButtonItem *start;
}
@property(nonatomic,strong)LOTAnimationView *laAnimation;
@property(nonatomic,strong)UIToolbar        *toolbar;

@end

@implementation DYAnimationVC
-(id)initWithAnimationType:(DYAnimationType)animationType{
    self = [super init];
    if (self) {
        jsonStr = [self event_marchWithAnimationType:animationType];
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadAnimationWithJsonType:jsonStr];
    [self event_setToolbar];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.toolbar.frame      = CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44);
    self.laAnimation.frame  = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    [self resetButton:start highlighted:YES];
    [self.laAnimation playWithCompletion:^(BOOL animationFinished) {
        [self resetButton:start highlighted:NO];
    }];
}
//开启无限循环
-(void)loopLottieAnimation:(UIBarButtonItem *)button{
    self.laAnimation.loopAnimation = !self.laAnimation.loopAnimation;
    [self resetButton:button highlighted:self.laAnimation.loopAnimation];
}
//点击播放
-(void)startLottieAnimation:(UIBarButtonItem *)button{
    if (self.laAnimation.isAnimationPlaying){
        [self resetButton:button highlighted:NO];
        [self.laAnimation pause];
    }else{
        [self resetButton:button highlighted:YES];
        [self.laAnimation playWithCompletion:^(BOOL animationFinished) {
            [self resetButton:button highlighted:NO];
        }];
    }
}
//重置按钮状态
-(void)resetButton:(UIBarButtonItem *)button highlighted:(BOOL)highlighted{
    button.tintColor = highlighted ? [UIColor redColor] : [UIColor colorWithRed:50.f/255.f green:207.f/255.f
                                                                           blue:193.f/255.f
                                                                          alpha:1.f];
}
//关闭当前界面
-(void)closeCurrentVC:(UIBarButtonItem *)button{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}
//加载json动画
-(void)loadAnimationWithJsonType:(NSString *)jsonString{
    [self.laAnimation removeFromSuperview];
    self.laAnimation = nil;
    [self resetAllButtons];

    self.laAnimation = [LOTAnimationView animationNamed:jsonString];
    self.laAnimation.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.laAnimation];
    [self.view setNeedsLayout];

}
//重置所有toolbarItem
-(void)resetAllButtons{
    for (UIBarButtonItem *button in self.toolbar.items) {
        [self resetButton:button highlighted:NO];
    }
}
//设置toolbar
-(void)event_setToolbar{
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
    
    //无限循环
    UIBarButtonItem *loop       = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(loopLottieAnimation:)];
    
    UIBarButtonItem *leftItem   =[ [UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //播放
    start = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(startLottieAnimation:)];
    
    //关闭
    UIBarButtonItem *close      = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(closeCurrentVC:)];
    
    self.toolbar.items    = @[leftItem,loop,leftItem,start,leftItem,close,leftItem];
    [self.view addSubview:self.toolbar];
}
-(NSString *)event_marchWithAnimationType:(DYAnimationType)animationType{
    switch (animationType) {
        case kDYAnimationOne:
            return  @"Watermelon.json";
            break;
        case kDYAnimationTwo:
            return  @"TwitterHeart.json";
            break;
        case kDYAnimationThree:
            return  @"vcTransition1.json";
            break;
        case kDYAnimationFour:
            return  @"HamburgerArrow.json";
            break;
        case kDYAnimationFive:
            return  @"LottieLogo2.json";
            break;
        case kDYAnimationSix:
            return  @"PinJump.json";
            break;
        case kDYAnimationSeven:
            return  @"G.json";
            break;
        case kDYAnimationEight:
            return  @"W.json";
            break;
        case kDYAnimationNine:
            return  @"F.json";
            break;
        case kDYAnimationTen:
            return  @"Q.json";
            break;
        default:
            break;
    }
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
