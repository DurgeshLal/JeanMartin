//
//  Track.m
//  APITest
//
//  Created by Admin on 9/6/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import "Track.h"

@implementation Track

- (instancetype) initWithDictionary : (NSDictionary *) dictionary
{
    self = [super init];
    
    if (self)
    {
        _trackArtist = [dictionary valueForKey:@"artistName"];
        _trackDescription = [dictionary valueForKey:@"longDescription"];
        _trackImgURL = [dictionary valueForKey:@"artworkUrl60"];
    }
    
    return self;
}
@end
