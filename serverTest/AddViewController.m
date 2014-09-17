//
//  AddViewController.m
//  serverTest
//
//  Created by KimJonghyeop on 2014. 4. 24..
//  Copyright (c) 2014년 KimJonghyeop. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController


#define URL         @"http://54.238.204.158:3333/v1/users"



#pragma mark -
#pragma mark init

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        httpReq = [[AFHTTPRequestOperationManager alloc] init];
    }
    
    return self;
}


#pragma mark -
#pragma mark Button Actions

- (IBAction)addButtonDidPush:(id)sender
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:textField1.text forKey:@"email"];
    [dic setObject:textField2.text forKey:@"username"];
//    [dic setObject:textField3.text forKey:@"age"];
    [dic setObject:textField4.text forKey:@"gender"];
    
    [httpReq POST:URL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        if(responseObject)
        {
            if ([responseObject[@"success"] intValue] > 0)
            {
                NSLog(@"success!!");
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, id responseObjects)
    {
        
    }];
}


- (IBAction)closeButtonDidPush:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark -
#pragma mark viewLife Cycles

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
