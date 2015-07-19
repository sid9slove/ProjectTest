//
//  DetailViewController.m
//  Study
//
//  Created by Hanke on 19/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "DetailViewController.h"
#import "SubjectModel.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *subField;

@property (weak, nonatomic) IBOutlet UITextField *teaField;

@property (weak, nonatomic) IBOutlet UITextField *roomField;

@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (weak, nonatomic) IBOutlet UITextField *timeField;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editeBtn;

- (IBAction)editAction:(UIBarButtonItem *)sender;

- (IBAction)saveAction:(id)sender;

@end



@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.subField.text = self.subModel.subject;
    self.teaField.text = self.subModel.teacher;
    self.roomField.text = self.subModel.room;
    self.roomField.text = self.subModel.date;
    self.timeField.text = self.subModel.time;
    
    
    //initial notification center
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.subField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.teaField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.roomField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.dateField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.timeField];
    
}

- (void)textChanged{
    
    if (self.subField.text.length && self.teaField.text.length){
        self.saveBtn.enabled =true;
        
    }else{
        self.saveBtn.enabled= false;
    }
    
    
}


- (IBAction)editAction:(UIBarButtonItem *)sender {
    
    if (self.subField.enabled) {
        self.subField.enabled = NO;
        self.teaField.enabled = NO;
        self.roomField.enabled = NO;
        self.dateField.enabled = NO;
        self.timeField.enabled = NO;
        [self.view endEditing:YES];
        
        self.saveBtn.hidden=YES;
        sender.title = @"Edite";
        self.subField.text = self.subModel.subject;
        self.teaField.text = self.subModel.teacher;
        self.roomField.text = self.subModel.room;
        self.roomField.text = self.subModel.date;
        self.timeField.text = self.subModel.time;
        
        
    }else{
        
        self.subField.enabled = YES;
        self.teaField.enabled = YES;
        self.roomField.enabled = YES;
        self.dateField.enabled = YES;
        self.timeField.enabled = YES;
        [self.view endEditing:NO];
        [self.view endEditing:NO];
        sender.title = @"Cancle";
    
    }
}

- (IBAction)saveAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delagate respondsToSelector:@selector(editeViewController:savedSub:)]) {
        self.subModel.subject = self.subField.text;
        self.subModel.teacher = self.roomField.text;
        self.subModel.room =self.roomField.text;
        self.subModel.date =self.roomField.text;
        self.subModel.time =self.timeField.text;
        [self.delagate editeViewController:self savedSub:self.subModel];
    }
    
    
}
@end
