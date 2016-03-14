//
//  ServerNextData.m
//  Instagram
//
//  Created by Yilmaz  on 14/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "ServerNextData.h"

@implementation ServerNextData

+(NSURL*)getNextDataURL:(NSDictionary*)data{
    
    NSString *urlString = data[@"pagination"][@"next_url"];

    NSURL *nextURL = [NSURL URLWithString:urlString];
    
    return nextURL;
    
}

@end
