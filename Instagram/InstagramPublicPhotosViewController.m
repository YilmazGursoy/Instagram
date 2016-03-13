//
//  InstagramPublicPhotosViewController.m
//  Instagram
//
//  Created by Yilmaz  on 12/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "InstagramPublicPhotosViewController.h"
#import "ImagesTableViewCell.h"

@implementation InstagramPublicPhotosViewController

-(void)viewDidLoad{

    
    self.receivedData = [[NSMutableData alloc]init];
    
    self.navigationItem.hidesBackButton = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.baseVC = [[BaseViewController alloc]initWithDelegate:self];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/v1/tags/nofilter/media/recent?access_token=%@",self.accessToken]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    number = 5;
    
}

#pragma mark - TableView Delegates--Data Source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ImagesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImagesCell" forIndexPath:indexPath];
    
    cell.userProfileNameLabel.text = self.accessToken;
    cell.timeLabel.text = @"Time";
    
    if(indexPath.row == number -1) {
        number = number + 5;
        [self.tableView reloadData];
    }
    
    return cell;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return number;
}

- (void)dealloc {
    
    [_tableView release];
    
    [_tableView release];
    
    [super dealloc];

}
#pragma mark - ServerImageDetailDelegate

-(void)reloadTableDataAndGetNewImages:(NSMutableArray *)newAllImageDetailObjects {
    
    
}
-(void)reloadingTableDataFailed {
    
}



@end
