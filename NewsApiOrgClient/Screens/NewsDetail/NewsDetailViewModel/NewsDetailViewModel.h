//
//  NewsDetailViewModel.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewModel : NSObject

@property (strong) NewsItem* model;

- (BOOL)hasImage;

@end

NS_ASSUME_NONNULL_END
