//
//  WSRespHandler.h
//  Movie
//
//  Created by SCTT CDMS on 16/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSRespHandler : NSObject

// Create singleton to avoid multiple allocation
+(WSRespHandler*)instance;

// Handle API getting response as per model structure
-(void)nowPlayingAPIRespUpdate:(NSDictionary *)response :(void (^)(id result))success;
-(void)similarMovieAPIRespUpdate:(NSDictionary *)response :(void (^)(id result))success;

@end

NS_ASSUME_NONNULL_END
