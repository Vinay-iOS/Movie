//
//  WSRespHandler.m
//  Movie
//
//  Created by SCTT CDMS on 16/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import "WSRespHandler.h"
#import "Movie.h"

#define IMG_BASE_URL @"https://image.tmdb.org/t/p/w500/"

@implementation WSRespHandler

static WSRespHandler *wsRespHandler = nil;

+(WSRespHandler*)instance
{
    if(wsRespHandler == nil)
        wsRespHandler = [[WSRespHandler alloc] init];
    return wsRespHandler;
}

-(void)nowPlayingAPIRespUpdate:(NSDictionary *)response :(void (^)(id result))success
{
    NSArray *respArr = response[@"results"];
    NSMutableArray *movieArr = [NSMutableArray new];
    
    if(respArr){
        
        for (NSDictionary *movieDict in respArr) {
        
            Movie *movie = [Movie new];
            movie.movieId = movieDict[@"id"];
            movie.title = movieDict[@"title"];
            movie.posterURL = [NSString stringWithFormat:@"%@%@",IMG_BASE_URL,movieDict[@"poster_path"]];
            movie.desc = movieDict[@"overview"];
            movie.releaseYear = movieDict[@"release_date"];
            [movieArr addObject:movie];
        }
    }
    success(movieArr);
}

-(void)similarMovieAPIRespUpdate:(NSDictionary *)response :(void (^)(id result))success
{
    NSArray *respArr = response[@"results"];
    NSMutableArray *movieArr = [NSMutableArray new];
    
    if(respArr){
        
        for (NSDictionary *movieDict in respArr) {
        
            Movie *movie = [Movie new];
            movie.movieId = movieDict[@"id"];
            movie.title = movieDict[@"title"];
            movie.posterURL = [NSString stringWithFormat:@"%@%@",IMG_BASE_URL,movieDict[@"poster_path"]];
            movie.desc = movieDict[@"overview"];
            movie.releaseYear = movieDict[@"release_date"];
            [movieArr addObject:movie];
        }
    }
    success(movieArr);
}



@end
