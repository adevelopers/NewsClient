//
//  NewsDetailViewController.m
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 05/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import "NewsDetailViewController.h"


@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self addUI];
    [self setupConstraints];
    self.imageView.alpha = 0;
    
    _titleLabel.text = self.viewModel.model.title;
    _desciptionView.text = self.viewModel.model.desc;
    
    if ([self.viewModel hasImage] == YES) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.imageView downloadedFromLink: self.viewModel.model.urlToImage onFinished:^{
                [UIView animateWithDuration:1 animations:^{
                    self.imageView.alpha = 1;
                }];
            }];
        });
    }
}

- (void)addUI {
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _desciptionView = [[UITextView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview: _titleLabel];
    [self.view addSubview: _imageView];
    [self.view addSubview: _desciptionView];
    
}

- (void)setupConstraints {
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_titleLabel.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [_titleLabel.leftAnchor constraintEqualToAnchor: self.view.leftAnchor constant: 10].active = YES;
    [_titleLabel.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant: -10].active = YES;
    [_titleLabel.heightAnchor constraintEqualToConstant: 40].active = YES;
    
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [_imageView.widthAnchor constraintEqualToAnchor: self.view.widthAnchor].active = YES;
    [_imageView.heightAnchor constraintEqualToConstant: 200].active = YES;
    [_imageView.topAnchor constraintEqualToAnchor: _titleLabel.bottomAnchor constant: 10].active = YES;
    [_imageView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor].active = YES;

    _desciptionView.translatesAutoresizingMaskIntoConstraints = NO;
    [_desciptionView.topAnchor constraintEqualToAnchor: _imageView.bottomAnchor constant: 10].active = YES;
    [_desciptionView.widthAnchor constraintEqualToAnchor: self.view.widthAnchor].active = YES;
    [_desciptionView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor].active = YES;
}

@end
