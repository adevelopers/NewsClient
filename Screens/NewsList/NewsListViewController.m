//
//  ViewController.m
//  NewsApiOrgClient
//
//  Created by Kirill Khudiakov on 04/03/2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

#import "NewsListViewController.h"
#import "KKSugar.h"
#import "NewsItem.h"
#import "NewsDetailViewController.h"


@interface NewsListViewController ()

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"News";
    _viewModel = [[NewsListViewModel alloc] init];
    
    self.title = [_viewModel getScreenTitle];
    self.view.backgroundColor = UIColor.orangeColor;
    
    _tableView = [[UITableView alloc] init];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"defaultCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview: _tableView];
    [self setupConstraints];
    
    [_viewModel loadNews: ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
        });
    }] ;
    
}

- (void)setupConstraints {
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [_tableView.topAnchor constraintEqualToAnchor: self.view.topAnchor].active = YES;
    [_tableView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor].active = YES;
    [_tableView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor].active = YES;
    [_tableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor].active = YES;
}


# pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.items.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    let cell = [tableView dequeueReusableCellWithIdentifier:@"defaultCell"];
    NewsItem* model = _viewModel.items[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}


# pragma mark - Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    let newsDetailViewController = [NewsDetailViewController new];
    let viewModel = [NewsDetailViewModel new];
    viewModel.model = _viewModel.items[indexPath.row];
    newsDetailViewController.viewModel = viewModel;
    [self.navigationController pushViewController: newsDetailViewController animated: YES];
}

@end
