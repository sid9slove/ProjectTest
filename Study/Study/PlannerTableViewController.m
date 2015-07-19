//
//  PlannerTableViewController.m
//  Study
//
//  Created by Hanke on 19/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "PlannerTableViewController.h"
#import "SubjectModel.h"
#import "AddViewController.h"
#import "DetailViewController.h"
//#import "CustomIOS7AlertView.h"

//#define SubjectKey @"subject"
//#define TeacherKey @"teacher"
//#define RoomKey @"room"
//#define DateKey @"date"
//#define TimeKey @"time"

#define SubjectFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"subjects.data"]

@interface PlannerTableViewController ()<AddViewControllerDelegate, DetailViewControllerDelegate>

- (IBAction)editAction:(id)sender;

@property (nonatomic, strong) NSMutableArray *subArray;



@end

@implementation PlannerTableViewController


- (NSMutableArray *)subArray{
    if (!_subArray) {
        _subArray = [NSKeyedUnarchiver unarchiveObjectWithFile:SubjectFilePath];
        if (_subArray == nil) {
            _subArray = [NSMutableArray array];
        }
        
    }
    return _subArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clearExtraLine:self.tableView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.subArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" ];
    
    SubjectModel *subModel = self.subArray[indexPath.row];
    
    UILabel *subLabel = (UILabel *)[cell viewWithTag:1];
    subLabel.text = subModel.subject;
    
    UILabel *teaLabel = (UILabel *)[cell viewWithTag:2];
    teaLabel.text = subModel.teacher;
    
    UILabel *roomLabel = (UILabel *)[cell viewWithTag:3];
    roomLabel.text = subModel.room;
    
    UILabel *dateLabel = (UILabel *)[cell viewWithTag:4];
    dateLabel.text = subModel.date;
    
    UILabel *timeLabel = (UILabel *)[cell viewWithTag:5];
    timeLabel.text = subModel.time;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    

    
    
    return cell;
}

#pragma mark - AddviewController delagate

- (void)addSubject:(AddViewController *)addVc didAdd: (SubjectModel *)subject{
    
    //add data model
    [self.subArray addObject:subject];
    
    //refresh
    [self.tableView reloadData];
    
    [NSKeyedArchiver archiveRootObject:self.subArray toFile:SubjectFilePath];
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //AddViewController *addVc = segue.destinationViewController;
    //addVc.delegate = self;
    id vc = segue.destinationViewController;
    if ([vc isKindOfClass:[AddViewController class]]) {//如果是跳转到添加联系人控制器
        //set delegate
        AddViewController *addVc = vc;
        addVc.delegate = self;
    }else if ([vc isKindOfClass:[DetailViewController class]]){
        DetailViewController *editVc = vc;
        //which row is selcted
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editVc.subModel = self.subArray[path.row];
        editVc.delagate = self;
    }
    
    
}


#pragma mark - cover extral cell
- (void)clearExtraLine :(UITableView *)tableView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    [self.tableView setTableFooterView:view];
}



#pragma mark - UITableView delagate
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //delete data
        [self.subArray removeObjectAtIndex:indexPath.row];
        //refresh
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        [NSKeyedArchiver archiveRootObject:self.subArray toFile:SubjectFilePath];
    }
}


#pragma mark -EditVc delagate
- (void) editeViewController:(DetailViewController *)editVc savedSub:(SubjectModel *)model{
    
    [self.tableView reloadData];
    
     [NSKeyedArchiver archiveRootObject:self.subArray toFile:SubjectFilePath];
}


- (IBAction)editAction:(id)sender {
   
    //initail
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add new " message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    //
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *subField) {
        subField.placeholder = @"Subject";
    }];
    
    
    [self presentViewController:alert animated:YES completion:NULL];
    
    
    
    
    
    
}

@end









