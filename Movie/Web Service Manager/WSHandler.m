//
//  WSHandler.m
//  Movie
//
//  Created by SCTT CDMS on 15/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import "WSHandler.h"
#import "Utils.h"
#import <AFNetworking.h>

@implementation WSHandler

static WSHandler *wsHandler = nil;

+(WSHandler *)instance
{
    if(wsHandler == nil)
        wsHandler = [[WSHandler alloc] init];
    
    return wsHandler;
}

//GET Request Handler
-(void)invokeAPIUsingGet:(NSString *)_requestUrl success:(void (^)(id result))success failure:(void (^)(NSError *error))failure
{
    [Utils isInternetAvailable:^(BOOL result)
    {
        if(result)
        {
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            [manager GET:_requestUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(error);
            }];
        }
        else{
            
        }
    }];
}




@end
