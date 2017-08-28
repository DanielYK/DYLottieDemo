//
//  DYAnimationVC.h
//  DYLottieDemo
//
//  Created by DanielYK on 2017/8/22.
//  Copyright © 2017年 DanielYK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM  (NSInteger,DYAnimationType){
    kDYAnimationOne     = 1,
    kDYAnimationTwo     = 2,
    kDYAnimationThree   = 3,
    kDYAnimationFour    = 4,
    kDYAnimationFive    = 5,
    kDYAnimationSix     = 6,
    kDYAnimationSeven   = 7,
    kDYAnimationEight   = 8,
    kDYAnimationNine    = 9,
    kDYAnimationTen     = 10,
};

@interface DYAnimationVC : UIViewController

//@property(nonatomic,assign)NSInteger animationType;
-(id)initWithAnimationType:(DYAnimationType)animationType;
@end
