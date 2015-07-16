//
//  Planner.m
//  Planner
//
//  Created by Hanke on 13/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "Planner.h"
#import "SubjectModle.h"
#import "NewViewController.h"
#import "Details.h"


@interface Planner()<NewViewControllerDelegate>

- (IBAction)newItemAction:(id)sender;


@property (nonatomic, strong) NSMutableArray *subjectArr;

@end

@implementation Planner

#define SubjectFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"subjects.data"]


- (NSMutableArray *)subjectArr{
    if (!_subjectArr) {
        _subjectArr = [NSKeyedUnarchiver unarchiveObjectWithFile:SubjectFilePath];
        if (_subjectArr == nil) {
            _subjectArr  = [NSMutableArray array];
        }
        
    }
    return _subjectArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clearExtraLine:self.tableView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.subjectArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" ];
    
    
    SubjectModle *subjectModel = self.subjectArr[indexPath.row];
    //SubjectModle *subjectModel = [[SubjectModle alloc] init];
    cell.textLabel.text = subjectModel.subject;
    cell.detailTextLabel.text = subjectModel.teacher;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}





-(void)addSubject:(NewViewController *)addVC didAddSubject:(SubjectModle *)subject{

    //add data modle
    [self.subjectArr addObject:subject];
    
    //refresh
    [self.tableView reloadData];
    
    [NSKeyedArchiver archiveRootObject:self.subjectArr toFile:SubjectFilePath];
    
    
}




#pragma mark - clear lines
- (void)clearExtraLine :(UITableView *)tableView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    [self.tableView setTableFooterView:view];
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //    //AddViewController *addVc = segue.destinationViewController;
    //    addVc.delegate = self;
    id vc = segue.destinationViewController;
    if ([vc isKindOfClass:[NewViewController class]]) {
        //to add new page
        //set delegate
        NewViewController *addVc = vc;
        addVc.delegate = self;
    }else if ([vc isKindOfClass:[Details class]]){
        Details *editVc = vc;
        //selcet detais page
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editVc = self.subjectArr[path.row];
        //editVc.delagate = self;
    }
    
    
}


//delete
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //delete the row
        [self.subjectArr removeObjectAtIndex:indexPath.row];
        //refresh
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        [NSKeyedArchiver archiveRootObject:self.subjectArr toFile:SubjectFilePath];
    }
}




- (IBAction)newItemAction:(id)sender {
    
 /*
  #ui alert controller
  //initial
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"new subject" message:@"edit details" preferredStyle:<#(UIAlertControllerStyle)#>];

    // add btn
    [alert addAction:[UIAlertAction actionWithTitle:@"done" style:<#(UIAlertActionStyle)#> handler:nil];
    
     [alert addAction:[UIAlertAction actionWithTitle:@"Cancle" style:<#(UIAlertActionStyle)#> handler:^(UIAlertAction *action){
        [self.navigationController popViewControllerAnimated: NO]
    }];
    
  */
      
    
}

@end
      
      
      
      
      
      
      

