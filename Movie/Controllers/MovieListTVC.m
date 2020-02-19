//
//  MovieListTVC.m
//  Movie
//
//  Created by SCTT CDMS on 15/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import "MovieListTVC.h"
#import "WSCaller.h"
#import "Movie.h"
#import "Utils.h"
#import "MovieInfoVC.h"
#import <SDWebImage.h>

@interface MovieListTVC ()
{
    NSArray *movieListArray;
}

@property (nonatomic,weak) IBOutlet UITableView *movieListTV;

@end

@implementation MovieListTVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Utils showIndicatorView:self.view];
    [self callMovieListAPI];
}

-(void)callMovieListAPI
{
    WSCaller *wsCaller = [WSCaller instance];
    [wsCaller nowPlayingWS:^(id  _Nonnull result) {
        [Utils hideIndicatorView:self.view];
        
        self->movieListArray = (NSArray *)result;
        [self.movieListTV reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return movieListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"MovieList";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:MyIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    // Make object of imageview which is predefine in storyboard with the tag value 1
    UIImageView *posterIV = [cell viewWithTag:1];
    
    Movie *movie = movieListArray[indexPath.row];
    [posterIV sd_setImageWithURL:[NSURL URLWithString:movie.posterURL]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self navigateToMovieInfoVC:movieListArray[indexPath.row]];
}

-(void)navigateToMovieInfoVC:(Movie *)movie
{
    MovieInfoVC *movieInfo = [self.storyboard instantiateViewControllerWithIdentifier:@"MovieInfoVC"];
    movieInfo.selectedMovie = movie;
    [self.navigationController pushViewController:movieInfo animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
