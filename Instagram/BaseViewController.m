//
//  BaseViewController.m
//  Instagram
//
//  Created by Yilmaz  on 12/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "BaseViewController.h"
#import "InstagramPublicPhotosViewController.h"
#import "ServerImageDetail.h"
#import "ServerNextData.h"

@interface BaseViewController()

@property (strong, nonatomic) NSMutableArray *allImageDetailsObjects;

@end

@implementation BaseViewController

static bool isGetToken = false;

-(instancetype)initWithDelegate:(id<ServerImageDetailDelegate>)delegate{
    
    if(self) {
        
        self.delegate = delegate;
    
    }
    
    return self;
}

-(void)showAlertMessage:(NSString*)message WithTitle:(NSString*)title andPop:(BOOL)isPop;{
    
    UIAlertController *alertController = [[UIAlertController alloc]init];
    
    [alertController setMessage:message];
    [alertController setTitle:title];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //TODO:
        if(isPop) {
            [self pop:nil];
        }
    }];
    
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}

- (IBAction)pop:(UIButton *)sender {
    
    [self dismissModalViewControllerAnimated:true];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
    if(!isGetToken) {
        _receivedData = [[NSMutableData alloc]init];
        isGetToken = true;
    }
    
    [_receivedData appendData:[data mutableCopy]];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    [self showAlertMessage:[NSString stringWithFormat:@"%@", error] WithTitle:@"Error" andPop:false];
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSString *response = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding];
    
    SBJsonParser *jResponse = [[SBJsonParser alloc]init];
    
    NSMutableDictionary *tokenData = [jResponse objectWithString:response];

    NSString *accessToken = [tokenData objectForKey:@"access_token"];
    
    InstagramPublicPhotosViewController *prof = [self.storyboard instantiateViewControllerWithIdentifier:PublicPhotosID];
    
    if(accessToken != nil) {
        //User call this function inside of FirstViewController
        
        prof.accessToken = accessToken;

        isGetToken = true;
        
        [self.navigationController pushViewController:prof animated:true];
        
    }else {
        //User call this function inside of InstagramPublicPhotosViewController
        
        prof.data = tokenData;
        
        self.nextImageDataURL = [ServerNextData getNextDataURL:tokenData];
        
        self.allImageDetailsObjects = [ServerImageDetail getAllImageDetailObjects:prof.data];

        if(self.allImageDetailsObjects.count > 0) {
    
            [self.delegate reloadTableDataAndGetNewImages:self.allImageDetailsObjects];
            isGetToken = false;
            
        } else {
            
            [self.delegate reloadingTableDataFailed];
            
        }
        
    }
}


@end