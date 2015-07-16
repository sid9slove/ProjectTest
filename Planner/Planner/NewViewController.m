//
//  NewViewController.m
//  Planner
//
//  Created by Hanke on 14/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "NewViewController.h"
#import "SubjectModle.h"

@interface NewViewController()
@property (weak, nonatomic) IBOutlet UITextField *subjectField;

@property (weak, nonatomic) IBOutlet UITextField *teacherField;

@property (weak, nonatomic) IBOutlet UITextField *room;

@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (weak, nonatomic) IBOutlet UITextField *timeField;


@property (weak, nonatomic) IBOutlet UIButton *doneBtn;

@property (weak, nonatomic) IBOutlet UIButton *addAnBtn;


- (IBAction)addAnthorAct;


- (IBAction)addAction;


- (IBAction)cancleBtn:(id)sender;

@end

@implementation NewViewController



- (void)viewDidLoad {
    //self.title  = "Setting";
    
    [super viewDidLoad];
    //add notification center
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.teacherField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.subjectField];
    
}


- (void)textChange{
    //if all field != nil, add it else pop message to say it completed them
    //make done btn enabled first to test
        if (self.subjectField.text.length && self.teacherField.text.length
            && self.room.text.length && self.dateField.text.length
            && self.timeField.text.length) {
            self.doneBtn.enabled = YES;
            self.addAnBtn.enabled = YES;
        }else{
            self.doneBtn.enabled = NO;
            self.addAnBtn.enabled = NO;
        }
   
    //self.doneBtn.enabled = (self.teacherField.text.length && self.room.text.length);
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //call keyboard
    [self.teacherField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (IBAction)cancleBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)addAnthorAct {
    
    //upload the data
    if ([self.delegate respondsToSelector:@selector(addAnthorAct:didAddSubject:)]) {
        SubjectModle *subjectModle = [[SubjectModle alloc] init];
        subjectModle.teacher = self.teacherField.text;
        subjectModle.subject = self.subjectField.text;
        subjectModle.room = self.room.text;
        subjectModle.date = self.dateField.text;
        subjectModle.time1 = self.timeField.text;
        [self.delegate addSubject:self didAddSubject:subjectModle];
    }
    
    //make all fiedls empty for new one
    self.teacherField.text = nil;
    self.subjectField.text = nil;
    self.room.text = nil;
    self.dateField.text = nil;
    self.timeField.text = nil;
    
    
    
}

- (IBAction)addAction {
    
    
    //back to planner page
    [self.navigationController popViewControllerAnimated:YES];
    
    
    //upload the data
    if ([self.delegate respondsToSelector:@selector(addAction:didAddSubject:)]) {
            SubjectModle *subjectModle = [[SubjectModle alloc] init];
            subjectModle.teacher = self.teacherField.text;
            subjectModle.subject = self.subjectField.text;
            subjectModle.room = self.room.text;
            subjectModle.date = self.dateField.text;
            subjectModle.time1 = self.timeField.text;
         [self.delegate addSubject:self didAddSubject:subjectModle];
    }
    
}


@end




