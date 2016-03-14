//
//  HelperClass.h
//  Instagram
//
//  Created by Yilmaz  on 14/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperClass : NSObject

+(NSData*)getUserProfileImageData:(NSString*)url;


+(NSData*)getUserImageData:(NSString*)url;

@end
