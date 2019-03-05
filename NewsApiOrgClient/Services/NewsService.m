//
//  NewsService.m
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import "NewsService.h"


NSString* const HOST = @"?q=&from=&sortBy=publishedAt";


@implementation NewsService

+ (id)sharedInstance {
    static NewsService *shared = nil;
    @synchronized(self) {
        if (shared == nil)
            shared = [[self alloc] init];
    }
    return shared;
}

- (void)onLoadNewsItems: (void (^)(NSArray* items))completion {
    let apiKey = @"669f5074a8fa42b4b93a347f39f4e595";
    let query = @"bitcoin";
    let host = @"https://newsapi.org/v2/everything";
    let selectedDate = @"2019-03-05";
    let soertBy = @"publishedAt";
    let link = [NSString stringWithFormat: @"%@?q=%@&from=%@&sortBy=%@&apiKey=%@",
                host,
                query,
                selectedDate,
                soertBy,
                apiKey];
    let url = [NSURL URLWithString: link];
    let task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                           completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                               
                                               NSError* e = nil;
                                               NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options: kNilOptions error: &e];
                                               NSMutableArray* newsItems = [NSMutableArray new];
                                               
                                               if ([json[@"status"] isEqualToString:@"ok"]){
                                                   NSArray* articles = json[@"articles"];
                                                   
                                                   foreach(item, articles) {
                                                       [newsItems addObject: [self matchingItemFromJson: item]];
                                                   }
                                                   
                                                   completion(newsItems);
                                               }
                                               
                                           } ];
    
    [task resume];
    
}

- (NewsItem*)matchingItemFromJson: (NSDictionary*) json {
    NewsItem* item = [NewsItem new];
    item.title = json[@"title"];
    item.desc = json[@"description"];
    item.content = json[@"conent"];
    item.urlToImage = json[@"urlToImage"];
    
    return item;
}

@end
