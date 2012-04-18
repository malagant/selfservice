//
//  MainViewControllerViewController.m
//  SelfService
//
//  Created by Michael Johann on 02.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController {
@private
    NSMutableArray *_menuItems;
}

@synthesize menu;
@synthesize menuItems = _menuItems;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItems = [[NSMutableArray alloc] init];

    UITableViewCell *loginMenuItem = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"default"];
    loginMenuItem.textLabel.text = @"Login";
    loginMenuItem.detailTextLabel.text = @"Login for self service";
    loginMenuItem.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    UITableViewCell *registerMenuItem = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"default"];
    registerMenuItem.textLabel.text = @"Register";
    registerMenuItem.detailTextLabel.text = @"Create an account";
    registerMenuItem.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    [self.menuItems addObject:loginMenuItem];
    [self.menuItems addObject:registerMenuItem];
}

- (void)viewDidUnload {
    [self setMenu:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)login {
    LoginViewController *lVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:lVC animated:YES];
}

- (void)registerAccount {
    RegisterViewController *rVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:rVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self login];
    } else if (indexPath.row == 1) {
        [self registerAccount];
    }

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.menuItems objectAtIndex:(NSUInteger) [indexPath row]];
}


@end
