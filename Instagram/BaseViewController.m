//
//  BaseViewController.m
//  Instagram
//
//  Created by Yilmaz  on 12/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

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

@end
