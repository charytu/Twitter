//
//  User.h
//  Twitter
//
//  Created by Chary Tu on 6/30/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const UserDidLoginNotification;
extern NSString *const UserDidLogoutNotification;

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenname;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *tagline;
@property (nonatomic, assign) NSInteger followingCount;
@property (nonatomic, assign) NSInteger followerCount;
@property (nonatomic, assign) NSInteger tweetCount;
//@property (nonatomic, assign) NSInteger retweetCount;
@property (nonatomic, assign) NSInteger favouritesCount;
-(id)initWithDictionary:(NSDictionary *)dictionary;

+(User *)currentUser;
+(void)setCurrentUser:(User *)currentUser;
+(void)logout;

@end
