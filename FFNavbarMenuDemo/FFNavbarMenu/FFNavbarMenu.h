//
//  FFNavbarMenu.h
//  FFNavbarMenuDemo
//
//  Created by 优购淮北 on 15/9/1.
//  Copyright (c) 2015年 李峰峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "UIView+FFExtension.h"

@interface UITouchGestureRecognizer : UIGestureRecognizer
@end

@interface FFNavbarMenuItem : NSObject

@property (copy, nonatomic, readonly) NSString *title;
@property (strong, nonatomic, readonly) UIImage *icon;

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon;
+ (FFNavbarMenuItem *)ItemWithTitle:(NSString *)title icon:(UIImage *)icon;

@end

@class FFNavbarMenu;
@protocol FFNavbarMenuDelegate <NSObject>

- (void)didShowMenu:(FFNavbarMenu *)menu;
- (void)didDismissMenu:(FFNavbarMenu *)menu;
- (void)didSelectedMenu:(FFNavbarMenu *)menu atIndex:(NSInteger)index;

@end

//iOS7+
@interface FFNavbarMenu : UIView

@property (copy, nonatomic, readonly) NSArray *items;
@property (assign, nonatomic, readonly) NSInteger maximumNumberInRow;
@property (assign, nonatomic, getter=isOpen) BOOL open;
@property (weak, nonatomic) id <FFNavbarMenuDelegate> delegate;

@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIColor *separatarColor;

- (instancetype)initWithItems:(NSArray *)items
                        width:(CGFloat)width
           maximumNumberInRow:(NSInteger)max;

- (void)showInNavigationController:(UINavigationController *)nvc;
- (void)dismissWithAnimation:(BOOL)animation;

@end

