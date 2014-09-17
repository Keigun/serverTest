//
//  ViewController.h
//  serverTest
//
//  Created by KimJonghyeop on 2014. 4. 24..
//  Copyright (c) 2014년 KimJonghyeop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"

@interface ViewController : UIViewController <UITableViewDataSource>        // tableView의 data 관리 주체임을 선언
{
    AFHTTPRequestOperationManager *httpReq;
    
    NSMutableArray *arrayData;
    
    IBOutlet UITableView        *tableView1;
}


@end
