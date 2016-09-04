//
//  ViewController.m
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "ViewController.h"
#import "WJCollection.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    [[NSNotificationCenter defaultCenter] postNotificationOnMainThreadWithName:@"" object:@"" userInfo:@"" waitUntilDone:1];
}


@end
