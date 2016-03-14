//
//  HelperClass.m
//  Instagram
//
//  Created by Yilmaz  on 14/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "HelperClass.h"

@implementation HelperClass

+(NSData*)getUserProfileImageData:(NSString*)profilePictureURL{

    NSURL *url = [NSURL URLWithString:profilePictureURL];

    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return data;
}


+(NSData*)getUserImageData:(NSString*)imageDataURL {

    NSURL *url = [NSURL URLWithString:imageDataURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return data;
}

@end
