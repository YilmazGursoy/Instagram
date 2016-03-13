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

@implementation BaseViewController

-(instancetype)initWithDelegate:(id)delegate{
    
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
    [_receivedData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    [self showAlertMessage:[NSString stringWithFormat:@"%@", error] WithTitle:@"Error" andPop:false];
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSString *response = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding];
    
    SBJsonParser *jResponse = [[SBJsonParser alloc]init];
    
    NSDictionary *tokenData = [jResponse objectWithString:response];
    
    NSString *accessToken = [tokenData objectForKey:@"access_token"];

    InstagramPublicPhotosViewController *prof = [self.storyboard instantiateViewControllerWithIdentifier:PublicPhotosID];

    
    if(accessToken != nil) {
        //User call this function inside of FirstViewController
        
        prof.accessToken = accessToken;
        
        [self.navigationController pushViewController:prof animated:true];
        
    } else {
        //User call this function inside of InstagramPublicPhotosViewController
        
        self.allImageDetailsObjects = [ServerImageDetail getAllImageDetailObjects:prof.data];

        if(self.allImageDetailsObjects.count > 0) {
    
            [self.delegate reloadTableDataAndGetNewImages:self.allImageDetailsObjects];

        } else {
            
            [self.delegate reloadingTableDataFailed];
            
        }
        
    }
}


@end