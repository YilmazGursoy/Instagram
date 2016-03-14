//
//  ImagesTableViewCell.h
//  Instagram
//
//  Created by Yilmaz  on 12/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagesTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *userProfileImageView;
@property (retain, nonatomic) IBOutlet UILabel *userProfileNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UIImageView *userImageView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *profileIndicatorView;
@property (retain, nonatomic) IBOutlet UILabel *createdTimeLabel;
@end
