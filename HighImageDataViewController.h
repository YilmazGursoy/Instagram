//
//  HighImageDataViewController.h
//  Instagram
//
//  Created by Yilmaz  on 14/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDetail.h"

@interface HighImageDataViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *profileImageView;
@property (retain, nonatomic) IBOutlet UILabel *profileName;
@property (retain, nonatomic) IBOutlet UIImageView *imageData;
@property (retain, nonatomic) IBOutlet UILabel *numberOfLikesLabel;

@property (strong, nonatomic) ImageDetail *imageDetailObject;

-(instancetype)initWithDetailObject:(ImageDetail*)imageDetailObject;

@end
