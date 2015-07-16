//
//  Details.m
//  Planner
//
//  Created by Hanke on 16/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "Details.h"
#import "SubjectModle.h"

@interface Details()

@property (weak, nonatomic) IBOutlet UITextField *subjectField;

@property (weak, nonatomic) IBOutlet UITextField *teacherField;

@property (weak, nonatomic) IBOutlet UITextField *roomField;

@property (weak, nonatomic) IBOutlet UITextField *dateFeild;

@property (weak, nonatomic) IBOutlet UITextField *timeField;

- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *doneBtn;




@end

@implementation Details

- (void)viewDidLoad {
   //[super viewDidLoad];
    self.subjectField.text = self.subjectModel.subject;
    self.teacherField.text = self.subjectModel.teacher;
    self.roomField.text = self.subjectModel.room;
    self.dateFeild.text = self.subjectModel.date;
    self.timeField.text = self.subjectModel.time1;
    
 
    
}

- (IBAction)save:(id)sender {
}
@end




