//
//  Track.h
//  APITest
//
//  Created by Admin on 9/6/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject
@property (nonatomic) NSString * trackArtist;
@property (nonatomic) NSString * trackDescription;
@property (nonatomic) NSString * trackImgURL;

- (instancetype) initWithDictionary : (NSDictionary *) dictionary;
@end
