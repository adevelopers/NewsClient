//
//  UIImageView+UIImageView_downloaded.m
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import "UIImageView+downloaded.h"
#import "KKSugar.h"

@implementation UIImageView (UIImageView_downloaded)

- (void)downloadedFromLink:(NSString*)link onFinished:( void (^) (void)) onFinished {
    NSLog(@"\nimage downloaded\n");
    let url = [[NSURL alloc] initWithString: link];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"errors %@", error);
        let image = [[UIImage alloc] initWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = image;
            onFinished();
        });
    }] resume];
    
    
    
}

@end
