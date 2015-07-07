//
//  Tweet.h
//  Twitter
//
//  Created by Chary Tu on 6/30/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *createAt;

@property (nonatomic, assign) NSInteger retweetCount;

@property (nonatomic, strong) User   *user;

-(id)initWithDictionary:(NSDictionary *)dictionary;

+(NSArray *)tweetsWithArray:(NSArray *)array;

@end
