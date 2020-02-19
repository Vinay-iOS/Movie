//
//  MovieInfoVC.m
//  Movie
//
//  Created by SCTT CDMS on 15/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import "MovieInfoVC.h"
#import "WSCaller.h"
#import "Movie.h"
#import "Utils.h"
#import <SDWebImage.h>

@interface MovieInfoVC ()
{
    NSArray *similarMovieArray;
}

@property (nonatomic,weak) IBOutlet UITableView *movieInfoTV;
@property (nonatomic,weak) IBOutlet UICollectionView *similarMoviewCV;

@end

@implementation MovieInfoVC

@synthesize selectedMovie;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Add tableview header to show movie poster
    self.movieInfoTV.tableHeaderView = [self addHeaderView];

    if(selectedMovie.movieId) {
        [Utils showIndicatorView:self.view];
        [self callSimilarMovieAPI:selectedMovie.movieId];
    }
}

-(UIView *)addHeaderView
{
    float view_width  = self.movieInfoTV.frame.size.width;
    float img_width = 150;
    float img_height = 225;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0, view_width, img_height)];
    headerView.backgroundColor = [UIColor blackColor];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(view_width/2-img_width/2, 0, 150 , img_height)];
    [imgView sd_setImageWithURL:[NSURL URLWithString:selectedMovie.posterURL]];
    [headerView addSubview:imgView];
    
    return headerView;
}

-(void)callSimilarMovieAPI:(NSString *)movieId
{
    WSCaller *wsCaller = [WSCaller instance];
    [wsCaller similarMovieWS:movieId :^(id  _Nonnull result) {
        
        [Utils hideIndicatorView:self.view];
        
        self->similarMovieArray = (NSArray *)result;
        [self.similarMoviewCV reloadData];
    }];
}



#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"MovieInfoList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    // Make object of labels which is predefine in storyboard with the tag value 1 & 2
    UILabel *title      = [cell viewWithTag:1];
    UILabel *subTitle   = [cell viewWithTag:2];
    
    // Movie info details arrangement based on given format in requirment
    if(indexPath.row == 0) {
        [title setText:@"Title"];
        [subTitle setText:selectedMovie.title];
    
    } else if (indexPath.row == 1)
    {
        [title setText:@"Release"];
        [subTitle setText:selectedMovie.releaseYear];
    }
    else if (indexPath.row == 2)
    {
        [title setText:@"Description"];
        [subTitle setText:selectedMovie.desc];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    // make dyamic height of tableview cell based on movie description text
    if(indexPath.row == 2) {
       CGFloat subTitleHeight =  [Utils getDynamicHeight:selectedMovie.desc width:tableView.frame.size.width];
        CGFloat titleHeight = 30;
        return titleHeight +subTitleHeight;
    }
    else
        return 60; // This deaulf value also can be dynamic but for now, i am using from storyboard cell height
}


#pragma mark - CollectionView Delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return similarMovieArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"SimilarMovieList";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MyIdentifier forIndexPath:indexPath];
    
    // Make object of imageview which is predefine in storyboard with the tag value 1
    UIImageView *posterIV = [cell viewWithTag:1];
    
    Movie *movie = similarMovieArray[indexPath.row];
    [posterIV sd_setImageWithURL:[NSURL URLWithString:movie.posterURL]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self navigateToMovieInfoVC:similarMovieArray[indexPath.row]];
}

-(void)navigateToMovieInfoVC:(Movie *)movie {
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
