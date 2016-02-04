//
//  ViewController.m
//  XXAnimationTableViewCell
//
//  Created by LittleKin on 16/2/4.
//  Copyright © 2016年 LittleKin. All rights reserved.
//

#import "ViewController.h"
typedef NS_ENUM(NSInteger,DirectionType)
{
    DirectionTypeLeft = 0,
    DirectionTypeRight = 1,
    DirectionTypeMiddle = 2
};

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
}

- (void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showCell:cell direction:DirectionTypeMiddle];
}

- (void)showCell:(UITableViewCell *)cell direction:(DirectionType)directionType
{
    if(directionType == DirectionTypeLeft)
    {
        cell.transform = CGAffineTransformMakeTranslation(-cell.frame.size.width,0);
        [UIView animateWithDuration:0.5 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
    else if (directionType == DirectionTypeRight)
    {
        cell.transform = CGAffineTransformMakeTranslation(cell.frame.size.width,0);
        [UIView animateWithDuration:0.5 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
    else
    {
        cell.transform = CGAffineTransformMakeScale(0.75f, 0.75f);
        [UIView animateWithDuration:0.5 animations:^{
            cell.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
