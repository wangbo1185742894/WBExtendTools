//
//  UIViewController+Push.m
//  CommunityPeople
//
//  Created by 彭睿 on 2019/11/27.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import "UIViewController+Push.h"
#import "WXApi.h"

#import "IntegralCenterCollCtor.h"
#import "IntegralStoreCollCtor.h"
#import "CommonWebViewCtor.h"
#import "IdCardListTabCtor.h"
#import "SQTSMainCtor.h"
#import "TopUpForMobileCtor.h"
#import "SQTSInvitationCtor.h"
#import "CardStoreCtor.h"
#import "LoginCtor.h"
#import "GoodsDetailsCtor.h"
#import "TimeLimitBuySuperCtor.h"

//验证是否登陆
#define isLogin if (![DataStorageTools objectForKey:kUserToken]) {\
    [HUDIndicatorTools ShowToastText:@"请先登录"];\
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
    [self pushToLogin];\
    });\
    return;\
}

@implementation UIViewController (Push)

/// 跳转登录页
- (void)pushToLogin {
    [self presentVc:[[UINavigationController alloc]initWithRootViewController:[LoginCtor new]]];
}

/// 跳转首页
- (void)pushToHomePage {
    
    [self.navigationController.tabBarController setSelectedIndex:0];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/// 跳转拼团购
- (void)pushToPTG {
    [self.navigationController.tabBarController setSelectedIndex:1];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/// 跳转卡片二维码
- (void)pushToCardCode {
    [self.navigationController.tabBarController setSelectedIndex:2];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/// 跳转购物车
- (void)pushToShoppingCard {
    [self.navigationController.tabBarController setSelectedIndex:3];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/// 跳转个人中心
- (void)pushToUserCenter {
    [self.navigationController.tabBarController setSelectedIndex:4];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/// 跳转商品详情
/// @param goodsId 商品ID
- (void)pushToGoodsDetailsParamsGoodsId:(NSString *)goodsId isSQTS:(BOOL)isSQTS {
    GoodsDetailsCtor *goods = [[GoodsDetailsCtor alloc]init];
    goods.goodsId = goodsId;
    goods.isSQTS = isSQTS;
    [self pushVc:goods];
}

/// 跳转店铺详情
/// @param shopId 店铺ID
- (void)pushToShopDetailsParamsShopId:(NSString *)shopId {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转农夫严选
/// @param navTitle 页面标题
/// @param categoryId 商品分类
- (void)pushToNFYXParamsNavTitle:(NSString *)navTitle categoryId:(NSString *)categoryId {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转优惠专区
/// @param navTitle 页面标题
- (void)pushToYHZQParamsNavTitle:(NSString *)navTitle {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转龙马海淘
/// @param shopId 店铺ID
/// @param categoryId 分类ID
- (void)pushToLMHTParamsShopId:(NSString *)shopId categoryId:(NSString *)categoryId {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转龙马助农
- (void)pushToLMZN {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转365 （京东，苏宁，网易严选）
/// @param navTitle 页面标题
/// @param shopId 店铺ID
/// @param categoryId 分类ID
- (void)pushTo365ParamsNavTitle:(NSString *)navTitle ShopId:(NSString *)shopId categoryId:(NSString *)categoryId {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转自提购
/// @param categoryId 分类ID
- (void)pushToZTGParamsCategoryId:(NSString *)categoryId {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转积分中心
- (void)pushToIntergraCenter {
    isLogin
    [self pushVc:[IntegralCenterCollCtor new]];
}

/// 跳转积分商城
- (void)pushToIntergraStore {
    isLogin
    [self pushVc:[IntegralStoreCollCtor new]];
}

/// 跳转卡列表
- (void)pushToCardCenter {
    isLogin
    [self pushVc:[IdCardListTabCtor new]];
}

/// 跳转卡商城
- (void)pushToCardStore {
    isLogin
    [self pushVc:[CardStoreCtor new]];
}

/// 跳转社区推手，分享赚
- (void)pushToSQTS {
    isLogin
    [self pushVc:[SQTSMainCtor new]];
}

/// 跳转社区推手邀请函
- (void)pushToInvitation {
    isLogin
    SQTSInvitationCtor *invitation = [SQTSInvitationCtor new];
    invitation.isCanScroToTop = true;
    [self pushVc:invitation];
}

/// 跳转话费充值
- (void)pushToPhoneTopUp {
    isLogin
    [self pushVc:[TopUpForMobileCtor new]];
}

/// 跳转邻里圈
- (void)pushToNeighborCircle {
    isLogin
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转楼下小店列表
- (void)pushToSmallShopList {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转健康厨房
- (void)pushToHealthKitchen {
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转生鲜
- (void)pushToFresh {
    isLogin
    [HUDIndicatorTools ShowToastText:@"先别急少年，还没做完呢"];
}

/// 跳转限时购列表
- (void)pushToTimeLimitGoodsList {
    [self pushVc:[TimeLimitBuySuperCtor new]];
}

/// 跳转锦鲤小程序
/// @param pathUrl 跳转路径
- (void)pushToJLMiniAppParamsPathUrl:(NSString *)pathUrl {
    isLogin
    
    WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
    launchMiniProgramReq.userName = STATIC_MINI_APP_SQR_FANCYCARP_KEY;
    
    NSString *path = pathUrl ? pathUrl : @"pages/scence/index";
    launchMiniProgramReq.path = path;
    
#ifdef DEBUG
    launchMiniProgramReq.miniProgramType = WXMiniProgramTypePreview;
#else
    launchMiniProgramReq.miniProgramType = WXMiniProgramTypeRelease;
#endif
    
    [WXApi sendReq:launchMiniProgramReq];
}


/// 跳转社区人小程序
/// @param pathUrl 跳转路径
- (void)pushToSQRMiniAppParamsPathUrl:(NSString *)pathUrl {
    isLogin
    
    WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
    launchMiniProgramReq.userName = STATIC_MINI_APP_SQR_KEY;
    
    NSString *path = pathUrl ? pathUrl : @"pages/scence/index";
    launchMiniProgramReq.path = path;
    
#ifdef DEBUG
    launchMiniProgramReq.miniProgramType = WXMiniProgramTypePreview;
#else
    launchMiniProgramReq.miniProgramType = WXMiniProgramTypeRelease;
#endif
    
    [WXApi sendReq:launchMiniProgramReq];
}



/// 跳转社区人生鲜小程序
/// @param pathUrl 跳转路径
- (void)pushToSQRFreshMiniAppParamsPathUrl:(NSString *)pathUrl {
    isLogin
    
    WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
    launchMiniProgramReq.userName = STATIC_MINI_APP_SQR_FRESH_KEY;
    
    NSString *path = pathUrl ? pathUrl : @"pages/scence/index";
    launchMiniProgramReq.path = path;
    
#ifdef DEBUG
    launchMiniProgramReq.miniProgramType = WXMiniProgramTypePreview;
#else
    launchMiniProgramReq.miniProgramType = WXMiniProgramTypeRelease;
#endif
    
    [WXApi sendReq:launchMiniProgramReq];
}


- (void)pushToCustomerServiceParamsOrderId:(NSString * __nullable)orderId skuId:(NSString * __nullable)skuId {
    isLogin
    [ApiConfigurationTools apiServiceConversationIdSuccess:^(NSString * _Nonnull conversationId) {
        CommonWebViewCtor *service = [[CommonWebViewCtor alloc]init];
        service.navItemTitle = @"客服";
        service.url = [ApiConfigurationTools dadaServiceNewUrlParamsChatPaneId:conversationId OrderId:orderId ? orderId : @"" skuId:skuId ? skuId : @""];
        [self pushVc:service];
    } failed:^(NSError * _Nonnull errorInfo) {
        
    }];
}

/// 跳转WebView
- (void)pushToWebViewParamsNavTitle:(NSString *)navTitle url:(NSString *)url {
    CommonWebViewCtor *service = [[CommonWebViewCtor alloc]init];
    service.navItemTitle = navTitle;
    service.url = url;
    [self pushVc:service];
}

@end
