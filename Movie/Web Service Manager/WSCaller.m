//
//  WSCaller.m
//  Movie
//
//  Created by SCTT CDMS on 16/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import "WSCaller.h"
#import "WSHandler.h"
#import "WSRespHandler.h"

#define API_KEY         @"275538b72baa81f8cd80c80f27deb327"
#define MOVIE_BASE_URL  @"http://api.themoviedb.org/3/movie/"

@implementation WSCaller

static WSCaller *wsCaller = nil;

+(WSCaller *)instance
{
    if(wsCaller == nil)
        wsCaller = [[WSCaller alloc] init];
    
    return wsCaller;
}

#pragma mark Movies regarding web services

-(void)nowPlayingWS:(void (^)(id result))success
{
    NSString *reqParameters = [self getNowPlayingWSParameters];
    
    WSHandler *wsHandler = [WSHandler instance];
    [wsHandler invokeAPIUsingGet:reqParameters success:^(id  _Nonnull result) {
        
        NSDictionary *resp = (NSDictionary *)result;
        if(resp)
        {
            WSRespHandler *instance = [WSRespHandler instance];
            [instance nowPlayingAPIRespUpdate:resp :^(id  _Nonnull result) {
                success(result);
            }];
        }
        
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"Error = %@",error.description);
    }];
}

-(NSString *)getNowPlayingWSParameters
{
    NSMutableString *requestStr = [NSMutableString  new];
    [requestStr appendFormat:@"%@",MOVIE_BASE_URL];
    [requestStr appendFormat:@"now_playing"];
    [requestStr appendFormat:@"?api_key=%@",API_KEY];
    return requestStr;
}

-(void)similarMovieWS:(NSString *)movieId :(void (^)(id result))success
{
    NSString *reqParameters = [self getsimilarMovieWSParameters:movieId];
    
    WSHandler *wsHandler = [WSHandler instance];
    [wsHandler invokeAPIUsingGet:reqParameters success:^(id  _Nonnull result) {
        
        NSDictionary *resp = (NSDictionary *)result;
        if(resp)
        {
            WSRespHandler *instance = [WSRespHandler instance];
            [instance nowPlayingAPIRespUpdate:resp :^(id  _Nonnull result) {
                success(result);
            }];
        }
        
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"Error = %@",error.description);
    }];
}

-(NSString *)getsimilarMovieWSParameters:(NSString *)movieId
{
    NSMutableString *requestStr = [NSMutableString  new];
    [requestStr appendFormat:@"%@",MOVIE_BASE_URL];
    [requestStr appendFormat:@"%@/similar",movieId];
    [requestStr appendFormat:@"?api_key=%@",API_KEY];
    return requestStr;
}


@end
