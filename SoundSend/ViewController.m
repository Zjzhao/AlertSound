//
//  ViewController.m
//  SoundSend
//
//  Created by 赵张杰 on 2017/9/7.
//  Copyright © 2017年 赵张杰. All rights reserved.
//

#import "ViewController.h"
#import "ZJSoundCenter.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [[ZJSoundCenter shareCenter] playSound:ZJSoundtypeCustomButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
