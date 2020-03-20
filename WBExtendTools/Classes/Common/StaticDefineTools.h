//
//  StaticDefineTools.h
//  WBExtendTools
//
//  Created by Azir on 2019/7/24.
//  Copyright © 2019 Azir. All rights reserved.
//

#ifndef StaticDefineTools_h
#define StaticDefineTools_h
#import <UIKit/UIKit.h>


#ifdef DEBUG

    #define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

    #define NSLog(FORMAT, ...) nil;

#endif



#define DEF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define DEF_SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DEF_SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define DEF_WIDTH_RATIO_FOR_375(width)  (DEF_SCREEN_WIDTH / 375) * (width)

// 导航栏高度
#define DEF_NAVIGATION_BAR_HEIGHT (DEF_IS_IphoneX ? 88.0 : 64.0)

// tabBar高度
#define DEF_TAB_BAR_HEIGHT (DEF_IS_IphoneX ? (49.0+34.0) : 49.0)

//状态栏高度
#define DEF_STATUS_BAR_HEIGHT (DEF_IS_IphoneX ? 44.0 : 20.0)

#define DEF_Window [UIApplication sharedApplication].keyWindow

//判断是否是刘海屏
#define DEF_IS_IphoneX ({\
BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
CGFloat height = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;\
isPhoneX = height > 0 ? true : false;\
}\
isPhoneX;\
})


//最上层vc跳转
#define DEF_PushToViewController(ViewController) \
ViewController.hidesBottomBarWhenPushed = YES;\
[[CommonTools topViewController].navigationController pushViewController:ViewController animated:YES]

//最上层vc跳转
#define DEF_PopToViewController \
[[CommonTools topViewController].navigationController popViewControllerAnimated:YES]


//弱引用/强引用
#define DEF_WeakSelf(type)  __weak typeof(type) weak##type = type;
#define DEF_StrongSelf(type)  __strong typeof(type) type = weak##type;


//判空
#define DEF_IsNilOrNull(_ref) (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]])  || ([(_ref) isKindOfClass:[NSNull class]]) || ([(_ref) isEqualToString:@"(null)"]) || ([(_ref) isEqualToString:@""]) || ([(_ref) isEqualToString:@"null"]) || ([(_ref) isEqualToString:@"<null>"]))

//设置 view 圆角和边框
#define DEF_ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


// 判断是否为4.0寸屏幕
#define DEF_iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为4.7寸屏幕
#define DEF_iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为5.5寸屏幕
#define DEF_iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f


#endif /* StaticDefineTools_h */
