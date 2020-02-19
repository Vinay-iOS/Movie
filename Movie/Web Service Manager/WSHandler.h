//
//  WSHandler.h
//  Movie
//
//  Created by SCTT CDMS on 15/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSHandler : NSObject

// Create singleton to avoid multiple allocation
+(WSHandler *)instance;

-(void)invokeAPIUsingGet:(NSString *)_requestUrl success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
