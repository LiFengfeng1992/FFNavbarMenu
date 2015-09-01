//
//  ViewController.m
//  FFNavbarMenuDemo
//
//  Created by 优购淮北 on 15/9/1.
//  Copyright (c) 2015年 李峰峰. All rights reserved.
//

#import "ViewController.h"
#import "FFNavbarMenu.h"

@interface ViewController () < FFNavbarMenuDelegate>

@property (assign, nonatomic) NSInteger numberOfItemsInRow;
@property (strong, nonatomic) FFNavbarMenu *menu;

@end

@implementation ViewController

- (FFNavbarMenu *)menu {
    if (_menu == nil) {
        FFNavbarMenuItem *item1 = [FFNavbarMenuItem ItemWithTitle:@"时间" icon:[UIImage imageNamed:@"0"]];
        FFNavbarMenuItem *item2 = [FFNavbarMenuItem ItemWithTitle:@"文件" icon:[UIImage imageNamed:@"1"]];
        FFNavbarMenuItem *item3 = [FFNavbarMenuItem ItemWithTitle:@"主页" icon:[UIImage imageNamed:@"2"]];
        FFNavbarMenuItem *item4 = [FFNavbarMenuItem ItemWithTitle:@"位置" icon:[UIImage imageNamed:@"3"]];
        FFNavbarMenuItem *item5 = [FFNavbarMenuItem ItemWithTitle:@"标签" icon:[UIImage imageNamed:@"4"]];
        FFNavbarMenuItem *item6 = [FFNavbarMenuItem ItemWithTitle:@"信息" icon:[UIImage imageNamed:@"5"]];
        
        
        
        _menu = [[FFNavbarMenu alloc] initWithItems:@[item1,item2,item3,item4,item5,item6] width:300 maximumNumberInRow:_numberOfItemsInRow];
        _menu.backgroundColor = [UIColor whiteColor];
        _menu.separatarColor = [UIColor lightGrayColor];
        _menu.textColor = [UIColor blackColor];
        _menu.delegate = self;
    }
    return _menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberOfItemsInRow = 3;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(openMenu:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.menu) {
        [self.menu dismissWithAnimation:NO];
    }
}

- (void)openMenu:(id)sender {
    self.navigationItem.rightBarButtonItem.enabled = NO;
    if (self.menu.isOpen) {
        [self.menu dismissWithAnimation:YES];
    } else {
        [self.menu showInNavigationController:self.navigationController];
    }
}

- (void)didShowMenu:(FFNavbarMenu *)menu {
    [self.navigationItem.rightBarButtonItem setTitle:@"隐藏"];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)didDismissMenu:(FFNavbarMenu *)menu {
    [self.navigationItem.rightBarButtonItem setTitle:@"菜单"];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)didSelectedMenu:(FFNavbarMenu *)menu atIndex:(NSInteger)index {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"你点击了" message:[NSString stringWithFormat:@"item%@", @(index+1)] delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [av show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    self.menu = nil;
}

@end

