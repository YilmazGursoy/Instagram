//
//  ServerImageDetail.m
//  Instagram
//
//  Created by Yilmaz  on 13/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerImageDetail.h"

@implementation ServerImageDetail


+(NSMutableArray*)getAllImageDetailObjects:(NSDictionary*)data{
    
    NSMutableString *userName;
    
    NSMutableString *createdTime;

    int numberOfImageLikes;
    
    NSMutableString *dataType;
    
    
    NSMutableArray *allObjects = [[NSMutableArray alloc]init];
    
    NSMutableArray *dataArray = data[@"data"];
    
    for( NSDictionary *imageObjectDictionary in dataArray ) {
        
        userName = imageObjectDictionary[@"user"][@"username"];
        
        createdTime = imageObjectDictionary[@""];
        
        
    
    
    }
    
    
    return allObjects;
}


@end
