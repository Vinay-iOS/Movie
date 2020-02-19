//
//  Movie.h
//  Movie
//
//  Created by SCTT CDMS on 16/2/20.
//  Copyright © 2020 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, strong) NSString *movieId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *releaseYear;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *posterURL;

@end

NS_ASSUME_NONNULL_END
