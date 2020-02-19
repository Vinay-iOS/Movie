//
//  MovieListTVC.h
//  Movie
//
//  Created by SCTT CDMS on 15/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieListTVC : UITableViewController

// Define this method as public for testing purpose
// This is a block method which received API response from model
// This method direct use in viewDidLoad as per demo requirement, it can be handle from a class who will decide which controller need to display as per based on user selection or default value like: Movie(Default, Action, Comady, etc), TV(Action, Adventure, etc.).
-(void)callMovieListAPI;

@end

NS_ASSUME_NONNULL_END
