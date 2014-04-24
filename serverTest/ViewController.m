//
//  ViewController.m
//  serverTest
//
//  Created by KimJonghyeop on 2014. 4. 24..
//  Copyright (c) 2014년 KimJonghyeop. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"

@interface ViewController ()

@end


#define URL         @"http://54.238.204.158:3333/v1/users"


@implementation ViewController

#pragma mark -
#pragma mark init

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        // 초기화
        httpReq = [[AFHTTPRequestOperationManager alloc] init];
    }
    return self;
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TestCell";
    
    TestCell *cell = (TestCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TestCell" owner:self options:nil];
        cell = nib[0];
    }
    
    cell.label1.text = [arrayData objectAtIndex:indexPath.row][@"email"];
    cell.label2.text = [arrayData objectAtIndex:indexPath.row][@"username"];
//    cell.label3.text = [arrayData objectAtIndex:indexPath.row][@"email"];
    cell.label4.text = [arrayData objectAtIndex:indexPath.row][@"gender"];
    
    return cell;
}

#pragma mark -
#pragma mark viewLife Cycles

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [arrayData removeAllObjects];
    
    // 통신 태움
    [httpReq GET:URL parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
            {
                if(responseObject)
                {
                    if ([responseObject[@"success"] intValue] > 0)
                    {
                        arrayData = [[NSMutableArray alloc] initWithArray:responseObject[@"result"]];
                        
                        [tableView1 reloadData];
                    }
                }
            }
         failure:^(AFHTTPRequestOperation *operation, id responseObjects)
            {
            }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark 통신 코드



@end
