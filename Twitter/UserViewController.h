//
//  UserViewController.h
//  Twitter
//
//  Created by Chary Tu on 7/3/15.
//  Copyright (c) 2015 chary tu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *postingLabel;
@property (weak, nonatomic) IBOutlet UILabel *createAtLabel;
@property(nonatomic, strong) NSArray *tweets;

@end
