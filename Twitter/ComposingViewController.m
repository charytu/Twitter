//
//  ComposingViewController.m
//  Twitter
//
//  Created by Chary Tu on 7/2/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "ComposingViewController.h"
#import <UIImageView+AFNetworking.h>
#import "User.h"
#import "TwitterClient.h"

@interface ComposingViewController ()

@end

@implementation ComposingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    User *user = [User currentUser];
    if (user != nil) {
        self.nameLabel.text = user.name;
        self.screennameLabel.text = user.screenname;
        [self.profileImage setImageWithURL:[NSURL URLWithString:user.profileImageUrl]];
        
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onTeetButton)];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) onTeetButton {
    NSString * composing = self.poseTextView.text;
    if (composing != nil) {
        NSDictionary *param = @{@"status": composing};
        [[TwitterClient sharedInstance] composing:param];
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) onCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
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
