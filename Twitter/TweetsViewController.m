//
//  TweetsViewController.m
//  Twitter
//
//  Created by Chary Tu on 7/2/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "TweetsViewController.h"
#import "LoginViewController.h"
#import "User.h"
#import "Tweet.h"
#import "TwitterClient.h"
#import "tweetTableViewCell.h"
#import "ComposingViewController.h"
#import "UserViewController.h"

@interface TweetsViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSArray *tweets;


@end

@implementation TweetsViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self fetchData];
 
    }
    return self;
}

-(void)fetchData {
    [[TwitterClient sharedInstance] homeTimeLineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
        self.tweets = tweets;
        [self.tableview reloadData];
        
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableview registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"tweetCell"];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
  //  self.tableview.rowHeight = UITableViewAutomaticDimension;
    self.tableview.rowHeight = 100;

    self.navigationItem.title = @"Home";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onSignOutButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(onNewButton)];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    
    [refreshControl addTarget:self action:@selector(refreshTable:) forControlEvents:UIControlEventValueChanged];
    [self.tableview addSubview:refreshControl];

    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
}

-(void) refreshTable:(UIRefreshControl *)refreshControl
{
    [self fetchData];
    [refreshControl endRefreshing];
}


-(void) onNewButton {
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[ComposingViewController alloc] init]];
    [self presentViewController:navController animated:YES completion:nil];
    

    //  [User logout];
}

-(void) onSignOutButton {
    [User logout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   // NSLog(@"total : %ld", (long)self.tweets.count);
    return self.tweets.count;
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweetCell" forIndexPath:indexPath];
    cell.tweet = self.tweets[indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UserViewController *svc = [[UserViewController alloc] initWithUser:self.tweets[indexPath.row]];
    [self.navigationController pushViewController:svc   animated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    TweetTableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableview indexPathForCell:cell];
    NSArray *tweet = self.tweets[indexPath.row];
    UserViewController *destioationVC = segue.destinationViewController;
    destioationVC.tweets = tweet;
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
