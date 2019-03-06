//
//  NewsDetailViewModel.m
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import "NewsDetailViewModel.h"

@implementation NewsDetailViewModel

- (BOOL)hasImage {
    if (self.model.urlToImage == (id)[NSNull null] || self.model.urlToImage.length == 0 ) {
        return NO;
    } else {
        return YES;
    }
}

@end
