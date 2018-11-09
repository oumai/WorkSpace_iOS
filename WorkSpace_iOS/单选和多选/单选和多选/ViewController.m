//
//  ViewController.m
//  单选和多选
//
//  Created by kmom on 2018/11/5.
//  Copyright © 2018 kmom. All rights reserved.
//

#import "ViewController.h"
#import "MultipleChooseVC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _selectedRow;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"多选" style:UIBarButtonItemStyleDone target:self action:@selector(chooseButtonItem)];
    
    
    _dataArray = [NSMutableArray arrayWithObjects:@"深圳",@"青岛",@"武汉",@"郑州",@"义乌",@"杭州",@"嘉兴",@"襄阳",@"松滋",@"咸宁", nil];
    
    [self.view addSubview:self.tableView];
}


- (void)chooseButtonItem
{
    MultipleChooseVC *vc = [[MultipleChooseVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
    if (_selectedRow == indexPath.row) {
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
    
    _selectedRow = indexPath.row;
    [_tableView reloadData];
    
}
@end
