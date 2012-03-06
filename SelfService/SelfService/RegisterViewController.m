//
//  RegisterViewController.m
//  SelfService
//
//  Created by Michael Johann on 02.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegistrationDTO.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize firstName;
@synthesize lastName;
@synthesize email;
@synthesize password;
@synthesize passwordConfirmation;

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
    [self setFirstName:nil];
    [self setLastName:nil];
    [self setEmail:nil];
    [self setPassword:nil];
    [self setPasswordConfirmation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// Wird beim Button “Register account” ausgelöst
- (IBAction)registerPressed:(id)sender {
    RegistrationDTO *registrationDTO = [[RegistrationDTO alloc] init];

    registrationDTO.firstName = self.firstName.text;
    registrationDTO.lastName = self.lastName.text;
    registrationDTO.email = self.email.text;
    registrationDTO.password = self.password.text;
    registrationDTO.passwordConfirmation = self.passwordConfirmation.text;

    [[RKObjectManager sharedManager] postObject:registrationDTO delegate:self];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if(textField.tag == 5) {
        textField.returnKeyType = UIReturnKeyDone;
    }
    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField returnKeyType] == UIReturnKeyNext)
    {
        NSInteger nextTag = [textField tag] + 1;
        UIView *nextTextField = [[self view] viewWithTag:nextTag];
        
        [nextTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response {
    if (response.statusCode == 201) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Registration successful" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Error posting registration to server. %@", error);
}

@end
