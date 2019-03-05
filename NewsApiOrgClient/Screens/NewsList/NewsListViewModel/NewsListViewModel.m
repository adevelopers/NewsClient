//
//  NewsListViewModel.m
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import "NewsListViewModel.h"
#import "NewsService.h"

@interface NewsListViewModel ()

@end

@implementation NewsListViewModel

- (NSString*)getScreenTitle {
    return @"News";
}

- (void)loadNews:( void (^) (void)) onLoaded {
    [[NewsService sharedInstance] onLoadNewsItems:^(NSArray *items) {
        self.items = items;
        onLoaded();
    }];
}

- (NewsItem*)getWith:(NSInteger) index {
    return _items[index];
}

@end
