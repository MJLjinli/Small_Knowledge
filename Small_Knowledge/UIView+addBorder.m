//
//  UIView+addBorder.m
//  Small_Knowledge
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "UIView+addBorder.h"

@implementation UIView (addBorder)


- (void)addBorder:(BorderDirectionType)direction color:(UIColor *)colore width:(CGFloat)width
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = colore.CGColor;
    switch (direction) {
        case BorderDirectionTop:
        {
            border.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, width);
            break;
        }
        case BorderDirectionLeft:
        {
            border.frame = CGRectMake(0, 0, width, self.bounds.size.height);
            break;
        }
        case BorderDirectionRight:
        {
            border.frame = CGRectMake(self.bounds.size.width - width, 0, width, self.bounds.size.height);
            break;
        }
        case BorderDirectionBottom:
        {
            border.frame = CGRectMake(0, self.bounds.size.height - width, self.bounds.size.width, width);
            break;
        }
            
        default:
            break;
    }
    [self.layer addSublayer:border];
}


@end
