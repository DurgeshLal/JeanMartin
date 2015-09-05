//
//  APITableViewCell.m
//  APITest
//
//  Created by Admin on 9/5/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import "APITableViewCell.h"

@implementation APITableViewCell
{
    UIImage * cellImage;
}
- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void) bindDataWithCell : (Track *) track
{
    self.labelTitle.text = track.trackArtist;
    self.labelDescription.text = track.trackDescription;
    self.imageView.image = (cellImage) ? cellImage : [UIImage imageNamed:@"placeholder"];
    
    NSString *imageUrl = track.trackImgURL;
    
    if (imageUrl && ![imageUrl isEqualToString:@""])
    {
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
        {
            if (!error && data)
            {
                self.imageView.image = [UIImage imageWithData:data];
                cellImage = self.imageView.image;
                [self setNeedsDisplay];
            }
        }];
    }
}

@end
