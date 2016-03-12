//
//  ImagesTableViewCell.m
//  Instagram
//
//  Created by Yilmaz  on 12/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ImagesTableViewCell.h"

@implementation ImagesTableViewCell

- (void)dealloc {
    [_userProfileImageView release];
    [_userProfileNameLabel release];
    [_timeLabel release];
    [UIPageViewController release];
    [super dealloc];
}
@end
