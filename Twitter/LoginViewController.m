//
//  LoginViewController.m
//  Twitter
//
//  Created by Chary Tu on 6/29/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "LoginViewController.h"
#import "TwitterClient.h"
#import "TweetsViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)onLogin:(id)sender {
    [[TwitterClient sharedInstance] loginWithCompletion:^(User *user, NSError *errror) {
        if(user != nil){
            NSLog(@"welcome to %@", user.name);
          
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[TweetsViewController alloc] init]];
            [self presentViewController:navController animated:YES completion:nil];
           
        } else {
            //Present error view
        }
    }];

 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
