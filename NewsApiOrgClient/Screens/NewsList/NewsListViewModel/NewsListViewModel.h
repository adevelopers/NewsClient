//
//  NewsListViewModel.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListViewModel : NSObject

@property (nonatomic, strong) NSArray* items;

- (NSString*)getScreenTitle;
- (void)loadNews:( void (^) (void)) onLoaded;
- (NewsItem*)getWith:(NSInteger) index;

@end

NS_ASSUME_NONNULL_END
