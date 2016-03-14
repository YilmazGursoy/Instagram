//
//  HighImageDataViewController.m
//  Instagram
//
//  Created by Yilmaz  on 14/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "HighImageDataViewController.h"
#import "HelperClass.h"

@implementation HighImageDataViewController

-(instancetype)initWithDetailObject:(ImageDetail*)imageDetailObject {

    if(self) {
    
        self.imageDetailObject = imageDetailObject;
    
    }
    
    return self;

}

-(void)viewDidLoad {
    
    dispatch_async(dispatch_get_main_queue(), ^{
       

        [self setupUserProfileImageAndUsername];
        
        [self setupUserImageData];
        
        
    });
    

}

#pragma mark - Helper Functions

-(void)setupUserProfileImageAndUsername{
    
    self.profileImageView.image = [UIImage imageWithData:[HelperClass getUserProfileImageData:self.imageDetailObject.userProfilePictureURL]];
    
    self.profileName.text = self.imageDetailObject.userName;
    
    self.numberOfLikesLabel.text = [NSString stringWithFormat:@"%d",self.imageDetailObject.numberOfImageLikes];

}

-(void)setupUserImageData{

    self.imageData.image = [UIImage imageWithData:[HelperClass getUserImageData:self.imageDetailObject.standartResolutionImageURL]];

}

@end
