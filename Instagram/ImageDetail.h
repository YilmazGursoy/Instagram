//
//  ImageDetail.h
//  Instagram
//
//  Created by Yilmaz  on 13/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDetail : NSObject

@property (strong, nonatomic) NSString *userName;

@property (strong, nonatomic) NSString *createdTime;

@property (nonatomic) int numberOfImageLikes;

@property (strong, nonatomic) NSMutableString *userProfilePictureURL;

@property (strong, nonatomic) NSString *dataType;

@property (strong, nonatomic) NSMutableString *lowResolutionImageURL;

@property (strong, nonatomic) NSMutableString *standartResolutionImageURL;


/**
 *  This function create ImageDetail Object
 *
 *  @param userName          sending data username
 *  @param createdTime       createdTime with unix time
 *  @param numberOfLikes     sending data number of Likes
 *  @param profilePictureURL sending data sender profile picture
 *  @param type              sending data is image or video
 *  @param lowResURL         sending data low resolution picture url
 *  @param standartResURL    sending data standart resolution picture url
 *
 *  @return Full ImageDetail object
 */
+(ImageDetail*)getImageDetailObjectUsingName:(NSString*)userName createdTime:(NSString*)createdTime Likes:(int)numberOfLikes profilePictureURL:(NSMutableString*)profilePictureURL dataType:(NSString*)type lowResImageURL:(NSMutableString*)lowResURL andStandartResImageURL:(NSMutableString*)standartResURL;

@end
