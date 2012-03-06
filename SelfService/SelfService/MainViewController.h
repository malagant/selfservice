//
//  MainViewControllerViewController.h
//  SelfService
//
//  Created by Michael Johann on 02.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *menu;

@property(nonatomic, strong) NSMutableArray *menuItems;
@end
