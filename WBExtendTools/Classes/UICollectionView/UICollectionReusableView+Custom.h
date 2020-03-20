//
//  UICollectionReusableView+Custom.h
//  WBExtendTools
//
//  Created by Azir on 2019/7/30.
//  Copyright © 2019 Azir. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionReusableView (Custom)

/**
 *  快速创建一个不是从xib中加载的 collectionView header
 */
+ (instancetype)headerViewWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

/**
 *  快速创建一个不是从xib中加载的 collectionView header
 */
+ (instancetype)nibHeaderViewWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

/**
 *  快速创建一个不是从xib中加载的 collectionView footer
 */
+ (instancetype)footerViewWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

/**
 *  快速创建一个不是从xib中加载的 collectionView footer
 */
+ (instancetype)nibFooterViewWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
