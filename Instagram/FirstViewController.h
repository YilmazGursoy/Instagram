//
//  MainViewController.h
//  Login-With-Instagram-Codegerms.com
//
//  Created by Ammad on 29/01/15.
//  Copyright (c) 2015 CodeGerms.com. All rights reserved.
//

#import "BaseViewController.h"

@interface FirstViewController : BaseViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *webview;
    OAConsumer* consumer;
    OAToken* requestToken;
    OAToken* accessToken;
    NSMutableData *receivedData;
}
@property (nonatomic, retain) IBOutlet UIWebView *webview;
//@property (nonatomic, retain) IBOutlet TapazineLoadingIndicator *indicator;
@property (nonatomic, retain) NSString *isLogin;
@property (assign, nonatomic) Boolean isReader;
@end
