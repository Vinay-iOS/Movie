//
//  WSCaller.h
//  Movie
//
//  Created by SCTT CDMS on 16/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSCaller : NSObject

// Create singleton to avoid multiple allocation
+(WSCaller *)instance;
-(void)nowPlayingWS:(void (^)(id result))success;
-(void)similarMovieWS:(NSString *)movieId :(void (^)(id result))success;

@end

NS_ASSUME_NONNULL_END
