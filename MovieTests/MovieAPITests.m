//
//  MovieAPITests.m
//  MovieTests
//
//  Created by SCTT CDMS on 19/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MovieListTVC.h"
#import "MovieInfoVC.h"


@interface MovieAPITests : XCTestCase
{
    MovieListTVC *movieList;
    MovieInfoVC *movieInfo;
}


@end

@implementation MovieAPITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    movieList = [[MovieListTVC alloc] init];
    movieInfo = [[MovieInfoVC alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceMovieListAPICalling {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [movieList callMovieListAPI];
    }];
}

- (void)testPerformanceMovieSimilarMoviewAPICalling {
    // This is an example of a performance test case.
    [self measureBlock:^{
        
        // get similar moview list using this API, given id belongs from a movie name is "FROZENII"
        [movieInfo callSimilarMovieAPI:@"330457"];
    }];
}

@end
