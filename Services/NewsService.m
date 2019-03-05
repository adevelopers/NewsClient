//
//  NewsService.m
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import "NewsService.h"


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
    
    let url = [NSURL URLWithString:@"https://newsapi.org/v2/everything?q=bitcoin&from=2019-03-05&sortBy=publishedAt&apiKey=669f5074a8fa42b4b93a347f39f4e595"];
               
    let task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                           completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                               NSLog(@"json loaded");
                                               
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
