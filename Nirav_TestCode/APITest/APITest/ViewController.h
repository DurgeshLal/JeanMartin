//
//  ViewController.h
//  APITest
//
//  Created by Admin on 9/5/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@end

