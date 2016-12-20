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
    self.view.backgroundColor = [UIColor randomColor];
    NSArray *arr = @[self];
    NSArray *arr1 = @[self,arr,[UIColor blueColor],[UIButton new],[NSObject new]];
    WJLog(@"")
    WJLog(@"")
    WJLog(@"%@",arr1.stringEncoded)
    WJLog(@"")
    WJLog(@"")
    WJLog(@"%@",arr1.stringPrettyEncoded)
}

@end
