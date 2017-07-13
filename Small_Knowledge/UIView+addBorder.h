//
//  UIView+addBorder.h
//  Small_Knowledge
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    BorderDirectionTop,
    BorderDirectionLeft,
    BorderDirectionBottom,
    BorderDirectionRight,
} BorderDirectionType;
@interface UIView (addBorder)


/**
 为UIView某个方向添加边框

 @param direction 方向
 @param colore 颜色
 @param width 宽度
 */
- (void)addBorder:(BorderDirectionType)direction color:(UIColor *)colore width:(CGFloat)width;
@end
