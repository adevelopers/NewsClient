//
//  UIImageView+UIImageView_downloaded.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (UIImageView_downloaded)

- (void)downloadedFromLink:(NSString*)link onFinished:( void (^) (void)) onFinished;

@end

NS_ASSUME_NONNULL_END
