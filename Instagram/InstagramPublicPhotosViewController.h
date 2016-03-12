//
//  InstagramPublicPhotosViewController.h
//  Instagram
//
//  Created by Yilmaz  on 12/03/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import "BaseViewController.h"

@interface InstagramPublicPhotosViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource> {
    int number;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
