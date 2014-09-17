//
//  AddViewController.h
//  serverTest
//
//  Created by KimJonghyeop on 2014. 4. 24..
//  Copyright (c) 2014년 KimJonghyeop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"

@interface AddViewController : UIViewController <UITextFieldDelegate>
{
    AFHTTPRequestOperationManager *httpReq;
    
    IBOutlet UITextField        *textField1;    // 이메일
    IBOutlet UITextField        *textField2;    // 네임
    IBOutlet UITextField        *textField3;    // 나이
    IBOutlet UITextField        *textField4;    // 성별
}

@end
