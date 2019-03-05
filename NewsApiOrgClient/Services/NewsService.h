//
//  NewsService.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKSugar.h"
#import "NewsItem.h"


#ifndef NewsService_h
#define NewsService_h

@interface NewsService : NSObject

+ (id)sharedInstance;

- (void)onLoadNewsItems: (void (^)(NSArray* items))completion;
- (NewsItem*)matchingItemFromJson: (NSDictionary*) json;

@end


#endif /* NewsService_h */
