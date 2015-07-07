//
//  Tweet.m
//  Twitter
//
//  Created by Chary Tu on 6/30/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
        self.text = dictionary[@"text"];
        NSString *createdAtString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
         formatter.dateFormat = @"EE MMM d HH:mm:ss Z y";
        //formatter.dateFormat = @"MM/dd/yyyy";
        NSDate *createdAt = [formatter dateFromString:createdAtString];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/dd/yy"];
        self.createAt = [dateFormat stringFromDate:createdAt];
        self.retweetCount = [dictionary[@"retweet_count"] integerValue];
        NSLog(@"retweet Count: %ld", self.retweetCount);
    }
    
    return self;
}
+(NSArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [NSMutableArray array];
    for(NSDictionary *dictionary in array){
        [tweets addObject:[[Tweet alloc] initWithDictionary:dictionary]];
    }
    return tweets;
}
@end
