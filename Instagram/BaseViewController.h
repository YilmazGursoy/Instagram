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

@protocol ServerImageDetailDelegate <NSObject>

@required

-(void)reloadTableDataAndGetNewImages:(NSMutableArray*)newAllImageDetailObjects;
-(void)reloadingTableDataFailed;

@end


@interface BaseViewController : UIViewController <ServerImageDetailDelegate>

@property (strong, nonatomic) NSMutableData *receivedData;
@property (strong, nonatomic) NSMutableArray *allImageDetailsObjects;
@property (strong, nonatomic) id<ServerImageDetailDelegate> delegate;

-(void)showAlertMessage:(NSString*)message WithTitle:(NSString*)title andPop:(BOOL)isPop;
-(instancetype)initWithDelegate:(id<ServerImageDetailDelegate>)delegate;
@end
