//
//  NewsItem.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsItem : NSObject <NewsItemProtocol>

@property (strong, readwrite) NSString* title;
@property (strong, readwrite) NSString* desc;
@property (strong, readwrite) NSString* content;
@property (strong, readwrite) NSString* urlToImage;

@end

NS_ASSUME_NONNULL_END
