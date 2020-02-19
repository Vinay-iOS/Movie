//
//  Utils.m
//  Movie
//
//  Created by SCTT CDMS on 15/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import "Utils.h"
#import <Reachability.h>
#import <MBProgressHUD.h>

@implementation Utils

+(void)isInternetAvailable:(void (^)(BOOL result))_result {
    __block BOOL reachable;
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    reachable =  networkStatus != NotReachable;
    
    _result(reachable);
}

+ (void)showIndicatorView:(UIView *)_view {
    [MBProgressHUD showHUDAddedTo:_view animated:YES];
}

+ (void)hideIndicatorView:(UIView *)_view {
    [MBProgressHUD hideHUDForView:_view animated:YES];
}

+(CGFloat)getDynamicHeight:(NSString *)text width:(float)width {
    CGSize expectedLabelSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil].size;
    
    return expectedLabelSize.height;
}

@end
