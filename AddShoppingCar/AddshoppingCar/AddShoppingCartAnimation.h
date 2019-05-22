//
//  AddShoppingCartAnimation.h
//  injoy_XJPDC
//
//  Created by 洪陪 on 2019/5/18.
//  Copyright © 2019 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddShoppingCartAnimation : NSObject

/**
 加入购物车的动画效果
 
 @param goodsImage 商品图片
 @param startPoint 动画起点
 @param endPoint   动画终点
 @param completion 动画执行完成后的回调
 */
+ (void)addToShoppingCartWithGoodsImage:(UIImage *)goodsImage
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint
                             completion:(void (^)(BOOL finished))completion;

@end

NS_ASSUME_NONNULL_END
