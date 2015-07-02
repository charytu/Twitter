//
//  UserViewController.m
//  Twitter
//
//  Created by Chary Tu on 7/3/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "UserViewController.h"
#import "User.h"
#import "Tweet.h"
#import "TweetsViewController.h"

@interface UserViewController ()


@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"< Home" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Reply" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    
    NSLog(@"user : %@", self.tweets);
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
