//
//  Commans.h
//  APITest
//
//  Created by Admin on 9/6/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ARTIST_FONT  [UIFont boldSystemFontOfSize:15]
#define DESCRIPTION_FONT  [UIFont systemFontOfSize:17]

@interface Commans : NSObject
+ (CGFloat)heightForString:(NSString *)str :(CGRect) labelFrame :(UIFont*)font;
@end
