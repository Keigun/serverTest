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
        httpReq = [[AFHTTPRequestOperationManager alloc] init];
    }
    return self;
}


// tableView의 data를 관리 하는 부분. 갯수나 cell같은 부분 자세한 내용은 cmd+click 으로 해당 메서드 reference 등 참고
// 동작등에 대한 델리게이트 정의는 UITableViewDataSource 가 아닌 UITableViewDelegate 에서 지원해줌 여기는 사용되지 않았다 궁금하면 써봐
#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 여기부터=============================
    static NSString *CellIdentifier = @"TestCell";
    
    TestCell *cell = (TestCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TestCell" owner:self options:nil];
        cell = nib[0];
    }
    // 여기까지==============================
    // 위에 영역이 custom cell 사용을 위한 초기화 및 재사용 부분
    
    // 이 메서드는 cell 갯수 만큼 불린다 고로 각 셀에 대한 값을 설정해 주면 됨
    // 선언은 해당 cell의 property로
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
    
    // xib나 storyboard에서 delegate나 datasource 연결이 가능하다
    // 날코딩의 경우는 아래 주석 부분이 초기에 설정 돼야 한다
//    tableView1.dataSource = self;
//    tableView1.delegate = self;
    
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
