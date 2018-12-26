//
//  CookieClass.h
//  cookie24小时
//
//  Created by kmom on 2018/11/22.
//  Copyright © 2018 kmom. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CookieClass : NSObject

+ (void)saveCookieWithDate:(NSDate *)date;

+ (BOOL)setCookie;

@end

NS_ASSUME_NONNULL_END
