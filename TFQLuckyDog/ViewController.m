//
//  ViewController.m
//  TFQLuckyDog
//
//  Created by 王立志 on 2018/10/22.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TFQWeakTimer.h"

@interface ViewController ()

@property (nonatomic, copy)NSArray *nameArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameArray = @[@"三余uncle", @"_啟灮丶", @"张乾TH", @"没头脑的佚哥哥", @"彭皓楠mr", @"吧唧吧唧_sky", @"尊贵滴微博会员", @"咸鱼梦想一夜暴富", @"拿起水枪biubiubiu", @"fkbg-m", @"哩哩呀Lily", @"五花肉阿一", @"-jokerhhh"];
    
    [self setNameLabel];
    
   
}

- (IBAction)didClickBeginBtn:(UIButton *)sender {
    [self algorithmOne];
}


//算法一
- (void)algorithmOne{
    NSLog(@"1");
    NSInteger index = arc4random() % self.nameArray.count;
    for(int i=0; i<self.nameArray.count; i++){
        UIButton *button = [self.view viewWithTag:i+100];
        if(index == i){
            button.backgroundColor = [UIColor yellowColor];
        }else{
            button.backgroundColor = [UIColor lightGrayColor];
        }
    }
}

//算法二
- (void)algorithmTwo{
    
}

//算法三
- (void)algorithmThree{
    
}

//算法四
- (void)algorithmFour{
    
}

//此方法介绍可参考掘金文章 https://juejin.im/post/5afbf79d6fb9a07aa83eeac0
- (void)setNameLabel{
    //存放上一个button
    UIButton *buttonBefore;
    //存放button距离左侧的宽度，来确定是否需要换行
    __block CGFloat right = 0.0;
    //间距
    CGFloat margin = 15.f;
    for(int i=0; i<self.nameArray.count; i++){
        //初始化button
        NSString *str = [self.nameArray objectAtIndex:i];
        CGFloat fitWidth = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}].width + 30;
        UIButton *button = [[UIButton alloc] init];
        button.tag = i + 100;
        [button setTitle:str forState:UIControlStateNormal];
        button.backgroundColor = [UIColor lightGrayColor];
        [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
        //给button设置约束
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(fitWidth);
            make.height.mas_equalTo(20);
            if(i==0){
                make.left.equalTo(self.view).offset(margin);
                make.top.equalTo(self.view).offset(80);
                right = margin + fitWidth + margin;
            }else{
                if(right+fitWidth > [UIScreen mainScreen].bounds.size.width){
                    make.top.mas_equalTo(buttonBefore.mas_bottom).offset(margin);
                    make.left.equalTo(self.view).offset(margin);
                    right =  margin+fitWidth+margin;
                }else{
                    make.left.mas_equalTo(buttonBefore.mas_right).offset(margin);
                    make.top.equalTo(buttonBefore);
                    right += fitWidth+margin;
                }
            }
        }];
        buttonBefore = button;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
