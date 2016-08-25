//
//  ViewController.m
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+WJAdd.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *now = [[NSDate alloc]init];
    [now stringWithFormat:@"yyyy-"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
