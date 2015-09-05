//
//  ViewController.m
//  APITest
//
//  Created by Admin on 9/5/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import "ViewController.h"
#import "APIDataFetcher.h"
#import "APITableViewCell.h"
#import "Track.h"
#import "Commans.h"

#define API_URL @"https://itunes.apple.com/search?term=Tom"

@interface ViewController ()
{
    NSMutableArray * resultArray;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self registerCells];
    [self loadData];
}

- (void) registerCells
{
    [_tableView registerNib:[UINib nibWithNibName:@"APITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"APITableViewCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) startActivityIndicator
{
    if (![_activityIndicator isAnimating])
    {
        [_activityIndicator startAnimating];
        _activityIndicator.hidden = NO;
    }
}

- (void) stopActivityIndicator
{
    if ([_activityIndicator isAnimating])
    {
        [_activityIndicator stopAnimating];
        _activityIndicator.hidden = YES;
    }
}

- (void) loadData
{
    if (!resultArray)
    {
        resultArray = [[NSMutableArray alloc] init];
    }
    else
    {
        [resultArray removeAllObjects];
    }
    
    [self startActivityIndicator];
    [APIDataFetcher loadDataFromAPI:API_URL :^(id result)
    {
        [self stopActivityIndicator];
        if ([result isKindOfClass:[NSDictionary class]])
        {
            NSArray * resultsArray = (NSMutableArray*)[(NSDictionary*)result valueForKeyPath:@"results"];
            
            for (NSDictionary * resultDict in resultsArray)
            {
                Track * track = [[Track alloc] initWithDictionary:resultDict];
                [resultArray addObject:track];
            }
            
            [_tableView reloadData];
        }
    }
    :^(NSError *error)
    {
        [self stopActivityIndicator];
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Track * track = [resultArray objectAtIndex:indexPath.row];
//    
//    CGFloat titleHeight = 24;
//    CGFloat descHeight = [Commans heightForString:track.trackDescription :CGRectMake(0, 0, 768, 700) :DESCRIPTION_FONT];
//    
//    return titleHeight + descHeight;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Track * track = [resultArray objectAtIndex:indexPath.row];
    
    CGFloat titleHeight = 24;
    CGFloat descHeight = [Commans heightForString:track.trackDescription :CGRectMake(0, 0, 768, 700) :DESCRIPTION_FONT];
    
    return titleHeight + descHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int count = [resultArray count];

    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    APITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"APITableViewCell"];

    if (!cell)
    {
        cell = [[APITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"APITableViewCell"];
    }
    
    Track * track = [resultArray objectAtIndex:indexPath.row];
    
    if (track)
    {
        [cell bindDataWithCell:track];
    }
    
    return cell;
}

@end
