//
//  LoginViewController.m
//  SelfService
//
//  Created by Michael Johann on 02.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize email;
@synthesize password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setEmail:nil];
    [self setPassword:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)loginPressed:(id)sender {
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if(textField.tag == 2) {
        textField.returnKeyType = UIReturnKeyDone;
    }
    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField returnKeyType] == UIReturnKeyNext)
    {
        //  The keyboard's return key is currently displaying 'Next' instead of
        //  'Done', so just move the insertion point to the next field. The
        //  keyboard will display 'Done' when we're at the last field.
        //
        //  (See the implementation of -textFieldShouldBeginEditing:, above.)
        //
        NSInteger nextTag = [textField tag] + 1;
        UIView *nextTextField = [self.view viewWithTag:nextTag];
        
        [nextTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}
@end
