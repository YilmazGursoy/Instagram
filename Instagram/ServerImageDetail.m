//
//  ServerImageDetail.m
//  Instagram
//
//  Created by Yilmaz  on 13/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerImageDetail.h"
#import "ImageDetail.h"

@implementation ServerImageDetail


+(NSMutableArray*)getAllImageDetailObjects:(NSDictionary*)data{
    
    NSMutableString *userName;
    
    NSMutableString *createdTime;

    int numberOfImageLikes;
    
    NSMutableString *dataType;
    
    NSMutableString *userProfilePicture;
    
    NSMutableString *lowResolutionImage;
    
    NSMutableString *standartResolutionImage;

    ImageDetail *imageDetailObject = [[ImageDetail alloc]init];
    
    NSMutableArray *allObjects = [[NSMutableArray alloc]init];
    
    NSMutableArray *dataArray = data[@"data"];
    
    for( NSDictionary *imageObjectDictionary in dataArray ) {
        
        userName = imageObjectDictionary[@"user"][@"username"];
        
        createdTime = imageObjectDictionary[@"created_time"];
        
        numberOfImageLikes = (int)imageObjectDictionary[@"likes"][@"count"];
        
        dataType = imageObjectDictionary[@"type"];
        
        userProfilePicture = imageObjectDictionary[@"user"][@"profile_picture"];
        
        lowResolutionImage = imageObjectDictionary[@"images"][@"low_resolution"][@"url"];
        
        standartResolutionImage = imageObjectDictionary[@"images"][@"standard_resolution"][@"url"];
        
        imageDetailObject = [ImageDetail getImageDetailObjectUsingName:userName createdTime:createdTime Likes:numberOfImageLikes profilePictureURL:userProfilePicture dataType:dataType lowResImageURL:lowResolutionImage andStandartResImageURL:standartResolutionImage];
        
        [allObjects addObject:imageDetailObject];
    
    }
    
    return allObjects;
}


@end
