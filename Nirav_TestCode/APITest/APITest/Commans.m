//
//  Commans.m
//  APITest
//
//  Created by Admin on 9/6/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import "Commans.h"

@implementation Commans

+ (CGFloat)heightForString:(NSString *)str :(CGRect) labelFrame :(UIFont*)font
{
    CGSize labelContraints = CGSizeMake(labelFrame.size.width, labelFrame.size.height);
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGRect labelRect = [str boundingRectWithSize:labelContraints options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:context];
    
//    NSLog(@"height:%f", labelRect.size.height);
    
//    CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(labelFrame.size.width, labelFrame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
//    NSLog(@"%f",size.height);
//    return size.height + 10;
    
    return labelRect.size.height;
}

@end
