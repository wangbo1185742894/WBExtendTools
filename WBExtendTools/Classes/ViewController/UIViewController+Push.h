//
//  UIViewController+Push.h
//  CommunityPeople
//
//  Created by 彭睿 on 2019/11/27.
//  Copyright © 2019 彭睿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Push)

/// 跳转登录页
- (void)pushToLogin;

/// 跳转首页
- (void)pushToHomePage;

/// 跳转拼团购
- (void)pushToPTG;

/// 跳转卡片二维码
- (void)pushToCardCode;

/// 跳转购物车
- (void)pushToShoppingCard;

/// 跳转个人中心
- (void)pushToUserCenter;

/// 跳转商品详情
/// @param goodsId 商品ID
/// @param isSQTS 是否是社区推手商品
- (void)pushToGoodsDetailsParamsGoodsId:(NSString *)goodsId isSQTS:(BOOL)isSQTS;

/// 跳转店铺详情
/// @param shopId 店铺ID
- (void)pushToShopDetailsParamsShopId:(NSString *)shopId;

/// 跳转农夫严选
/// @param navTitle 页面标题
/// @param categoryId 商品分类
- (void)pushToNFYXParamsNavTitle:(NSString *)navTitle categoryId:(NSString *)categoryId;

/// 跳转优惠专区
/// @param navTitle 页面标题
- (void)pushToYHZQParamsNavTitle:(NSString *)navTitle;

/// 跳转龙马海淘
/// @param shopId 店铺ID
/// @param categoryId 分类ID
- (void)pushToLMHTParamsShopId:(NSString *)shopId categoryId:(NSString *)categoryId;

/// 跳转龙马助农
- (void)pushToLMZN;

/// 跳转365 （京东，苏宁，网易严选）
/// @param navTitle 页面标题
/// @param shopId 店铺ID
/// @param categoryId 分类ID
- (void)pushTo365ParamsNavTitle:(NSString *)navTitle ShopId:(NSString *)shopId categoryId:(NSString *)categoryId;

/// 跳转自提购
/// @param categoryId 分类ID
- (void)pushToZTGParamsCategoryId:(NSString *)categoryId;

/// 跳转积分中心
- (void)pushToIntergraCenter;

/// 跳转积分商城
- (void)pushToIntergraStore;

/// 跳转卡列表
- (void)pushToCardCenter;

/// 跳转卡商城
- (void)pushToCardStore;

/// 跳转社区推手，分享赚
- (void)pushToSQTS;

/// 跳转社区推手邀请函
- (void)pushToInvitation;

/// 跳转话费充值
- (void)pushToPhoneTopUp;

/// 跳转邻里圈
- (void)pushToNeighborCircle;

/// 跳转楼下小店列表
- (void)pushToSmallShopList;

/// 跳转健康厨房
- (void)pushToHealthKitchen;

/// 跳转生鲜
- (void)pushToFresh;

/// 跳转限时购列表
- (void)pushToTimeLimitGoodsList;

/// 跳转锦鲤小程序
/// @param pathUrl 跳转路径
- (void)pushToJLMiniAppParamsPathUrl:(NSString *)pathUrl;

/// 跳转社区人小程序
/// @param pathUrl 跳转路径
- (void)pushToSQRMiniAppParamsPathUrl:(NSString *)pathUrl;

/// 跳转社区人生鲜小程序
/// @param pathUrl 跳转路径
- (void)pushToSQRFreshMiniAppParamsPathUrl:(NSString *)pathUrl;


/// 跳转客服
/// @param orderId 订单ID（非必传）
/// @param skuId 规格ID（非必传）
- (void)pushToCustomerServiceParamsOrderId:(NSString * __nullable)orderId skuId:(NSString * __nullable)skuId;

/// 跳转WebView
- (void)pushToWebViewParamsNavTitle:(NSString *)navTitle url:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
