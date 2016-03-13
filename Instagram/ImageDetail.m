//
//  ImageDetail.m
//  Instagram
//
//  Created by Yilmaz  on 13/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ImageDetail.h"

@implementation ImageDetail

-(ImageDetail*)getImageDetailObjectUsingName:(NSString*)userName
                                                        createdTime:(NSString*)createdTime
                                                        Likes:(int)numberOfLikes
                                                        profilePictureURL:(NSURL*)profilePictureURL
                                                        dataType:(NSString*)type
                                                        lowResImageURL:(NSURL*)lowResURL
                                                        andStandartResImageURL:(NSURL*)standartResURL{
    ImageDetail *detailObject = [[ImageDetail alloc]init];
    
    detailObject.userName = userName;
    
    detailObject.createdTime = createdTime;
    
    detailObject.numberOfImageLikes = numberOfLikes;
    
    detailObject.userProfilePictureURL = profilePictureURL;
    
    detailObject.dataType = type;

    detailObject.lowResolutionImageURL = lowResURL;
    
    detailObject.standartResolutionImageURL = standartResURL;
    
    return detailObject;
    
}


@end
