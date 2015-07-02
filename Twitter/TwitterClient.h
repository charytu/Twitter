//
//  TwitterClient.h
//  Twitter
//
//  Created by Chary Tu on 6/29/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager
+ (TwitterClient *)sharedInstance;

- (void)loginWithCompletion:(void (^)(User *user,NSError *errror))completion;
- (void)openURL:(NSURL *)url;

- (void)homeTimeLineWithParams:(NSDictionary *)params completion:(void (^)(NSArray *tweets, NSError *error))completion;

-(void)composing:(NSDictionary *)params;

@end
