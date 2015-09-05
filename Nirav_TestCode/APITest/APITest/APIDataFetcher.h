//
//  APIDataFetcher.h
//  APITest
//
//  Created by Admin on 9/5/15.
//  Copyright (c) 2015 IphoneGameZone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(id result);
typedef void (^FailureBlock)(NSError * error);

@interface APIDataFetcher : NSObject

+ (void) loadDataFromAPI : (NSString *) url : (SuccessBlock) successBlock :(FailureBlock) failureBlock;



@end
