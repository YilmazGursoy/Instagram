//
//  ImageDetail.m
//  Instagram
//
//  Created by Yilmaz  on 13/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ImageDetail.h"

@implementation ImageDetail

+(ImageDetail*)getImageDetailObjectUsingName:(NSString*)userName
                                                        createdTime:(NSString*)createdTime
                                                        Likes:(int)numberOfLikes
                                                        profilePictureURL:(NSMutableString*)profilePictureURL
                                                        dataType:(NSString*)type
                                                        lowResImageURL:(NSMutableString*)lowResURL
                                                        andStandartResImageURL:(NSMutableString*)standartResURL{

    NSDate* date1 = [NSDate dateWithTimeIntervalSince1970:[createdTime doubleValue]];
    
    NSDate* date2 = [NSDate date];
    
    NSTimeInterval distanceBetweenDates = [date2 timeIntervalSinceDate:date1];
    
    double secondsInAnHour = 60;
    
    NSInteger hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
    
    ImageDetail *detailObject = [[ImageDetail alloc]init];
    
    detailObject.userName = userName;
    
    detailObject.createdTime = [NSString stringWithFormat:@"%ld",(long)hoursBetweenDates];
    
    detailObject.numberOfImageLikes = numberOfLikes;
    
    detailObject.userProfilePictureURL = profilePictureURL;
    
    detailObject.dataType = type;

    detailObject.lowResolutionImageURL = lowResURL;
    
    detailObject.standartResolutionImageURL = standartResURL;
    
    return detailObject;
    
}


@end
