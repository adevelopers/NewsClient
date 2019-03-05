//
//  ViewController.h
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 04/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListViewModel.h"

@interface NewsListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NewsListViewModel *viewModel;


- (void)setupConstraints;

@end

