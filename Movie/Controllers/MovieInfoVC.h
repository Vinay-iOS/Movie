//
//  MovieInfoVC.h
//  Movie
//
//  Created by SCTT CDMS on 15/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieInfoVC : UIViewController <UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

// This public variable will store selected movie details from another class
@property (nonatomic,strong) Movie *selectedMovie;


// Make this function public for testing
// This is a block method which received API response from model
// By default using similar movies but it can be similar TV Serials based on selected type from another class
-(void)callSimilarMovieAPI:(NSString *)movieId;

@end

NS_ASSUME_NONNULL_END
