//
//  BaseViewController.h
//  Instagram
//
//  Created by Yilmaz  on 12/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OAuthConsumer.h"
#import "AppDelegate.h"
#import "AppConstants.h"
#import "JSON.h"

@interface BaseViewController : UIViewController


-(void)showAlertMessage:(NSString*)message WithTitle:(NSString*)title andPop:(BOOL)isPop;

@end
