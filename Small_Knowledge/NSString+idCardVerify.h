//
//  NSString+idCardVerify.h
//  Small_Knowledge
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (idCardVerify)

/**
 身份证号验证
 */
- (BOOL)validateIdentityCard;
@end
