//
//  TweetsTableViewController.m
//  Twitter
//
//  Created by Chary Tu on 7/1/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import "TweetsTableViewController.h"
#import "LoginViewController.h"
#import "User.h"
#import "Tweet.h"
#import "TwitterClient.h"
#import "tweetTableViewCell.h"

@interface TweetsTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSArray *tweets;

@end

@implementation TweetsTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[TwitterClient sharedInstance] homeTimeLineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
            self.tweets = tweets;
            //NSLog(@"Tweets: %@", tweets);
           /*
            for (Tweet *tweet in tweets){
             
             NSLog(@"text: %@", tweet.text);
             NSLog(@"profileimage: %@, date:%@", tweet.user.profileImageUrl, tweet.createAt);
             NSLog(@"name:%@  screen name:%@", tweet.user.name , tweet.user.screenname);
             }
            */
            [self.tableView reloadData];

            
        }];
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"tweetCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
  //  self.tableView.rowHeight = UITableViewAutomaticDimension;
   //  self.tableView.rowHeight = 90;
    //self.tableView. = 90;
    self.navigationItem.title = @"Home";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onSignOutButton)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(onNewButton)];
    
    
    self.tableView.rowHeight = 90;
  
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.

}

-(void) onNewButton {
  //  [User logout];
}

-(void) onSignOutButton {
    [User logout];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"total : %ld", (long)self.tweets.count);
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
