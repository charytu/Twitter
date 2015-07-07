//
//  UserViewController.m
//  Twitter
//
//  Created by Chary Tu on 7/3/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "UserViewController.h"

//#import "Tweet.h"
#import "TweetsViewController.h"
#import <UIImageView+AFNetworking.h>

@interface UserViewController ()
@property(nonatomic, strong) Tweet *tweets;

@end

@implementation UserViewController

- (id)initWithUser:(Tweet *)tweets {
    self = [super init];
    
    if (self) {
        self.tweets = tweets;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.navigationItem.title = @"Tweet";
    self.nameLabel.text = self.tweets.user.name;
    self.screenLabel.text = self.tweets.user.screenname;
    self.createAtLabel.text = self.tweets.createAt;
    self.postingLabel.text = self.tweets.text;
    [self.profileImage setImageWithURL:[NSURL URLWithString:self.tweets.user.profileImageUrl]];
    self.reteetsLabel.text = [NSString stringWithFormat:@"%ld", (long)self.tweets.retweetCount];

    self.favoritesLabel.text = [NSString stringWithFormat:@"%ld", (long)self.tweets.user.favouritesCount];
  //  NSLog(@"RE count : %ld", (long)self.tweets.retweetCount);
    //NSLog(@"user : %@", self.tweets.user.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) onCancelButton {
    
    TweetsViewController *svc = [[TweetsViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];

//    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
