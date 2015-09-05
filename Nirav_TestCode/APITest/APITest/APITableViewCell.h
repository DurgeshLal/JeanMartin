//
//  APITableViewCell.h
//  APITest
//
//  Created by Admin on 9/5/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Track.h"

@interface APITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
- (void) bindDataWithCell : (Track *) track;
@end
