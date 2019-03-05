//
//  NewsDetailViewController.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDetailViewModel.h"
#import "UIImageView+downloaded.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewController : UIViewController

@property (strong, nonatomic) UILabel* titleLabel;
@property (strong, nonatomic) UIImageView* imageView;
@property (strong, nonatomic) UITextView* desciptionView;

@property (strong, nonatomic) NewsDetailViewModel* viewModel;

@end

NS_ASSUME_NONNULL_END
