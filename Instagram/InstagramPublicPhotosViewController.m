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

    self.navigationItem.hidesBackButton = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    number = 5;
    
    
}



#pragma mark - TableView Delegates--Data Source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ImagesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImagesCell" forIndexPath:indexPath];
    
    cell.userProfileNameLabel.text = @"Name";
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

@end
