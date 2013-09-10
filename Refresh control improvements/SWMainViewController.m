//
//  SWMainViewController.m
//  refresh test
//
//  Created by Simon Westerlund on 9/10/13.
//  Copyright (c) 2013 Simon Westerlund. All rights reserved.
//

#import "SWMainViewController.h"
#import "SWRefreshControl.h"

@interface SWMainViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SWMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        [self setCollectionView:[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]]];
        [self.collectionView setAlwaysBounceVertical:YES];

    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    [self.collectionView setFrame:CGRectOffset([self.view frame], 0, 20)];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:[self collectionView]];
    
    // just fill the collection view with something
    UIView *view = [[UIView alloc] initWithFrame:[self.collectionView bounds]];
    [view setBackgroundColor:[UIColor purpleColor]];
    [self.collectionView addSubview:view];
}

// end refreshing refresh control after two seconds
- (void)endRefreshingRefreshControl:(SWRefreshControl *)refreshControl {
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [refreshControl endRefreshing];
        NSLog(@"endRefreshing");
    });
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    SWRefreshControl *refresh = [SWRefreshControl new];
    [self.collectionView addSubview:refresh];
    [refresh addTarget:self action:@selector(endRefreshingRefreshControl:) forControlEvents:UIControlEventValueChanged];
    [refresh beginRefreshing];
    
    NSLog(@"beginRefreshing");
    [self endRefreshingRefreshControl:refresh];
}

@end
