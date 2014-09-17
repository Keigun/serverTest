//
//  TestCell.h
//  serverTest
//
//  Created by KimJonghyeop on 2014. 4. 24..
//  Copyright (c) 2014년 KimJonghyeop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell

// cell xib내의 오른쪽 메뉴탭의 세번째 네번째 (Identity Inspector하고 attribute inspector에 class(지금은 TestCell)로 지정 해주어야 됨)

@property (assign, nonatomic) IBOutlet UILabel      *label1;        // 외부(즉, tableView를 소유한 ViewController)에서 호출 가능하기 위해 property로 설정
@property (assign, nonatomic) IBOutlet UILabel      *label2;
@property (assign, nonatomic) IBOutlet UILabel      *label3;
@property (assign, nonatomic) IBOutlet UILabel      *label4;

@end
