//
//  NewsItemProtocol.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 06/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NewsItemProtocol <NSObject>

@property (strong, readwrite) NSString* title;
@property (strong, readwrite) NSString* desc;
@property (strong, readwrite) NSString* content;
@property (strong, readwrite) NSString* urlToImage;

@end

NS_ASSUME_NONNULL_END
