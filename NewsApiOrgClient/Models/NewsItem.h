//
//  NewsItem.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsItem : NSObject

@property (strong, readwrite) NSString* title;
@property (strong) NSString* desc;
@property (strong) NSString* content;
@property (strong) NSString* urlToImage;

@end

NS_ASSUME_NONNULL_END
