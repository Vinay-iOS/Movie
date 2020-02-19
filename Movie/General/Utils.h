//
//  Utils.h
//  Movie
//
//  Created by SCTT CDMS on 15/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+(void)isInternetAvailable:(void (^)(BOOL result))_result;
+ (void)showIndicatorView:(UIView *)_view;
+ (void)hideIndicatorView:(UIView *)_view;
+(CGFloat)getDynamicHeight:(NSString *)text width:(float)width;

@end

NS_ASSUME_NONNULL_END
