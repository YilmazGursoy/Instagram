//
//  InstagramPublicPhotosViewController.m
//  Instagram
//
//  Created by Yilmaz  on 12/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "InstagramPublicPhotosViewController.h"
#import "ImagesTableViewCell.h"
#import "ImageDetail.h"
#import "HelperClass.h"
#import "HighImageDataViewController.h"

@interface InstagramPublicPhotosViewController() {
    NSURL *mainURL;
}

@end

@implementation InstagramPublicPhotosViewController

static bool controlForRemoveAllObjects = false;

-(void)viewDidLoad{

    
    self.navigationItem.hidesBackButton = YES;
    self.receivedData = [[NSMutableData alloc]init];
    self.allImageDetailObjects = [[NSMutableArray alloc] init];
    self.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchbar.delegate = self;
    mainURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",imageRequestURL,self.accessToken]];
    
    controlForRemoveAllObjects = false;
    
    [self getRequest:mainURL];
}

#pragma mark - TableView Delegates--Data Source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ImagesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:imageCellID forIndexPath:indexPath];

    cell.userImageView.image = nil;
    
    [cell.profileIndicatorView startAnimating];
    
    [cell.indicatorView startAnimating];
    
    cell.profileIndicatorView.hidden = false;
    
    cell.indicatorView.hidden = false;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        ImageDetail *imageDetailObject = self.allImageDetailObjects[indexPath.row];
        
        cell.userProfileNameLabel.text = imageDetailObject.userName;
        
        cell.createdTimeLabel.text = [NSString stringWithFormat:@"%@ minutes ago",imageDetailObject.createdTime];
        
        NSData *profileImageData = [HelperClass getUserProfileImageData:imageDetailObject.userProfilePictureURL];
    
        NSData *sharingImageData = [HelperClass getUserImageData:imageDetailObject.lowResolutionImageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            ImagesTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];

            if (updateCell) {
                
                updateCell.userProfileImageView.image = [UIImage imageWithData:profileImageData];
                updateCell.userImageView.image = [UIImage imageWithData:sharingImageData];
                [updateCell setNeedsLayout];
            
            }
                
            [cell.profileIndicatorView stopAnimating];
            [cell.indicatorView stopAnimating];
            cell.profileIndicatorView.hidden = true;
            cell.indicatorView.hidden = true;
            
        });
    
    });
    
    if(indexPath.row == self.allImageDetailObjects.count -1) {
        
        [self getRequest:self.nextImageDataURL];
        
    }
    
    return cell;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.allImageDetailObjects.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    ImageDetail *imageDetailObject = self.allImageDetailObjects[indexPath.row];
    
    HighImageDataViewController *prof = [self.storyboard instantiateViewControllerWithIdentifier:@"ID"];
    
    prof.imageDetailObject = imageDetailObject;
    
    [self.navigationController pushViewController:prof animated:true];

}

#pragma mark - ServerImageDetailDelegate

-(void)reloadTableDataAndGetNewImages:(NSMutableArray *)newAllImageDetailObjects {
    
    if(controlForRemoveAllObjects) {
        
        [self.allImageDetailObjects removeAllObjects];
        controlForRemoveAllObjects = false;
    }
    
    
    for( ImageDetail *object in newAllImageDetailObjects ) {

        [self.allImageDetailObjects addObject:object];
    
    }
    [self.tableView reloadData];
}

-(void)reloadingTableDataFailed {
    
    [self showAlertMessage:@"Aradiginiz tag ile alakalı birsey bulunamamistir" WithTitle:@"Uyarı!" andPop:true];
    
    [self.searchbar resignFirstResponder];
    
}

#pragma mark - HelperFunctions

-(void)getRequest:(NSURL*)url{
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    [self.searchbar resignFirstResponder];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?access_token=%@",searchBar.text,self.accessToken]];
    
    controlForRemoveAllObjects = true;
    
    [self getRequest:url];
    
}


@end
