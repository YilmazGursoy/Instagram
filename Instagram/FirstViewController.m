//
//  MainViewController.m
//  Login-With-Instagram-Codegerms.com
//
//  Created by Ammad on 29/01/15.
//  Copyright (c) 2015 CodeGerms.com. All rights reserved.
//

#import "FirstViewController.h"



@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize webview;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = [NSString stringWithFormat:@"https://api.instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=code",client_id,callback];
    
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"URL  =  %@",[[request URL] host]);
    
    if ([[[request URL] host] isEqualToString:@"codegerms.com"]) {
        
        NSString* verifier = nil;
        NSArray* urlParams = [[[request URL] query] componentsSeparatedByString:@"&"];
        for (NSString* param in urlParams) {
            NSArray* keyValue = [param componentsSeparatedByString:@"="];
            NSString* key = [keyValue objectAtIndex:0];
            if ([key isEqualToString:@"code"]) {
                verifier = [keyValue objectAtIndex:1];
                break;
            }
        }
        
        if (verifier) {
            
            NSString *data = [NSString stringWithFormat:@"client_id=%@&client_secret=%@&grant_type=authorization_code&redirect_uri=%@&code=%@",client_id,secret,callback,verifier];
            
            NSString *url = [NSString stringWithFormat:@"https://api.instagram.com/oauth/access_token"];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
            [request setHTTPMethod:@"POST"];
            [request setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
            NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
            receivedData = [[NSMutableData alloc] init];
        } else {
            
        }
        
        [webView removeFromSuperview];
        
        return NO;
    }
    return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
    [receivedData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    [self showAlertMessage:[NSString stringWithFormat:@"%@", error] WithTitle:@"Error" andPop:false];
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSString *response = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    SBJsonParser *jResponse = [[SBJsonParser alloc]init];
    
    NSString *accessToken = [[jResponse objectWithString:response] objectForKey:@"access_token"];
    
    [self showAlertMessage:accessToken WithTitle:@"Access Token" andPop:false];
}
@end
