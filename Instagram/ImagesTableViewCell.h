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
@end
