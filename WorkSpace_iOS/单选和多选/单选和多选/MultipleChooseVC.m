//
//  MultipleChooseVC.m
//  单选和多选
//
//  Created by kmom on 2018/11/9.
//  Copyright © 2018 kmom. All rights reserved.
//

#import "MultipleChooseVC.h"



@interface MultipleChooseVC ()<UITableViewDelegate,UITableViewDataSource>
{

    BOOL *_isSlect;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MultipleChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //运行时动态分配内存
    _isSlect = malloc(sizeof(BOOL)*_dataArray.count);
    //把内存中的初始值置为0
    memset(_isSlect, 0, sizeof(BOOL)*_dataArray.count);

    _dataArray = [NSMutableArray arrayWithObjects:@"深圳",@"青岛",@"武汉",@"郑州",@"义乌",@"杭州",@"嘉兴",@"襄阳",@"松滋",@"咸宁", nil];
    
    
    _isSlect = malloc(sizeof(BOOL)*_dataArray.count);
    [self.view addSubview:self.tableView];
}


- (void)chooseButtonItem
{
    
}

- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"UITableViewCellO";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    if (_isSlect[indexPath.row]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellStyleDefault;
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _isSlect[indexPath.row] = !_isSlect[indexPath.row];
    [_tableView reloadData];
    
}
@end
