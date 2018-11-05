//
//  ViewController.m
//  字典装入数组
//
//  Created by kmom on 2018/11/5.
//  Copyright © 2018 kmom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *datasource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _datasource = [NSMutableArray arrayWithObjects:
                   
                   @{@"key":@"Environment",@"title":@"1、您能较快适应新的生活、学习或工作环境吗？",@"answer":@[@"完全不能",@"偶尔",@"比较多",@"完全可以"],@"value":@"0"},
                   @{@"key":@"Role",@"title":@"2、您如何评价自己在生活、学习或工作中的担当的角色？",@"answer":@[@"非常不称职",@"偶尔称职",@"比较称职",@"非常称职"],@"value":@"0"},
                   @{@"key":@"Harmony",@"title":@"3、您的家庭生活和睦吗？",@"answer":@[@"非常不和睦",@"偶尔",@"比较和睦",@"非常和睦"],@"value":@"0"},
                   @{@"key":@"Handle",@"title":@"4、对于生活、学习和工作中不愉快的事，您能妥善处理好吗？",@"answer":@[@"完全不能",@"偶尔",@"比较多",@"完全可以"],@"value":@"0"},
                   @{@"key":@"Close",@"title":@"5、与您关系密切的亲戚、同事或朋友多吗？",@"answer":@[@"根本没有",@"较少",@"比较多",@"非常多"],@"value":@"0"},
                   @{@"key":@"Activity",@"title":@"6、您经常参加一些社会、集体活动吗？",@"answer":@[@"从不参加",@"偶尔",@"比较多",@"非常多"],@"value":@"0"},
                   @{@"key":@"RelyOn",@"title":@"7、在需要帮助时，您在很大程度能够依靠家庭、朋友吗？",@"answer":@[@"根本不能",@"偶尔",@"比较多",@"完全可以"],@"value":@"0"},
                   @{@"key":@"Talk",@"title":@"8、您遇到烦恼会主动找家人或朋友倾诉吗？",@"answer":@[@"从不主动",@"偶尔主动",@"比较多",@"非常主动"],@"value":@"0"},
                   
                   nil];
    
    
    //请求的数据
    NSDictionary *ReturnData = @{
                                 @"Environment":@"0",
                                 @"Role":@"1",
                                 @"Harmony":@"2",
                                 @"Handle":@"3",
                                 @"Close":@"0",
                                 @"Activity":@"1",
                                 @"RelyOn":@"2",
                                 @"Talk":@"3",
                                 };
    
    for (int i = 0; i<_datasource.count; i++)
    {
        //取一个字典
        NSMutableDictionary *mutaDic = [NSMutableDictionary dictionaryWithDictionary:_datasource[i]];
        //找到key对应的值(Environment)
        NSString *keyStringForValue = [mutaDic objectForKey:@"key"];
        //通过Environment去找请求的数据对应的value(0,1,2)
        NSString *requetDataValue = [NSString stringWithFormat:@"%@",[ReturnData objectForKey:keyStringForValue]];
        //装进_datasource中的value对应的值中
        [mutaDic setObject:requetDataValue forKey:@"value"];
        //代替
        [_datasource replaceObjectAtIndex:i withObject:mutaDic];
    }

    NSLog(@"_datasource = %@",_datasource);
    
}


@end
