//
//  Movie.m
//  Movie
//
//  Created by SCTT CDMS on 16/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import "Movie.h"

@implementation Movie

static Movie *movie = nil;

+(Movie*)instance
{
    if(movie == nil)
        movie = [[Movie alloc] init];
    return movie;
}

@end
