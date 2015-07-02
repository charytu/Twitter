//
//  TweetTableViewCell.m
//  Twitter
//
//  Created by Chary Tu on 7/1/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "TweetTableViewCell.h"

#import <UIImageView+AFNetworking.h>

@implementation TweetTableViewCell

- (void)awakeFromNib {
 //   self.nameLable.preferredMaxLayoutWidth = self.nameLable.frame.size.width;
    // Initialization code
}

- (void) layoutSubviews {
    [super layoutSubviews];
  //  self.nameLable.preferredMaxLayoutWidth = self.nameLable.frame.size.width;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        NSLog(@"Selected name : %@", self.tweet.user.name);
    }
   
    // Configure the view for the selected state
}
-(void)setTweet:(Tweet *)tweet{
    _tweet = tweet;
    self.nameLable.text = self.tweet.user.name;
    self.screenNameLable.text = self.tweet.user.screenname;
    self.dateLabel.text = self.tweet.createAt;
    self.summaryLabel.text = self.tweet.text;
    [self.profileImage setImageWithURL:[NSURL URLWithString:self.tweet.user.profileImageUrl]];

}
@end
