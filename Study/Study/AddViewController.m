//
//  AddViewController.m
//  Study
//
//  Created by Hanke on 19/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "AddViewController.h"
#import "SubjectModel.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *subField;

@property (weak, nonatomic) IBOutlet UITextField *teacherField;

@property (weak, nonatomic) IBOutlet UITextField *roomField;

@property (weak, nonatomic) IBOutlet UITextField *DateField;

@property (weak, nonatomic) IBOutlet UITextField *timeField;

@property (weak, nonatomic) IBOutlet UIButton *doneBtn;

@property (weak, nonatomic) IBOutlet UIButton *addAnthorBtn;

- (IBAction)doneAction;


- (IBAction)addAnotherAction;


@end

@implementation AddViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //initial notification center
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.subField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.teacherField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.roomField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.DateField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.timeField];
    
}

- (void)textChanged{
  
    if (self.subField.text.length && self.teacherField.text.length){
        self.doneBtn.enabled =true;
        self.addAnthorBtn.enabled =true;
    }else{
        self.doneBtn.enabled =false;
        self.addAnthorBtn.enabled =false;
    }
    
    
}


- (IBAction)doneAction {
    
    //check completed tables
    if (self.subField.text.length && self.teacherField.text.length &&
        self.roomField.text.length && self.DateField.text.length && self.timeField.text.length) {
        
        
        [self.navigationController popViewControllerAnimated:YES];
        
        if ([self.delegate respondsToSelector:@selector(addSubject:didAdd:)]) {
            SubjectModel *subModle = [[SubjectModel alloc] init];
            subModle.subject = self.subField.text;
            subModle.teacher = self.teacherField.text;
            subModle.room = self.roomField.text;
            subModle.date = self.DateField.text;
            subModle.time = self.timeField.text;
            [self.delegate addSubject:self didAdd:subModle];
        }
        
    }else{
        
        
        //initial
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!!" message:@"Please Complete all talbes" preferredStyle:UIAlertControllerStyleActionSheet];
        //add btn
        [alert addAction:[UIAlertAction actionWithTitle:@"Confirmed" style:UIAlertActionStyleCancel handler:nil]];
        
        //popout
        [self presentViewController:alert animated:YES completion:NULL];
    }
    
   

}


- (IBAction)addAnotherAction {
    
    if ([self.delegate respondsToSelector:@selector(addSubject:didAdd:)]) {
        SubjectModel *subModle = [[SubjectModel alloc] init];
        subModle.subject = self.subField.text;
        subModle.teacher = self.teacherField.text;
        subModle.room = self.roomField.text;
        subModle.date = self.DateField.text;
        subModle.time = self.timeField.text;
        [self.delegate addSubject:self didAdd:subModle];
        
        
        self.subField.text = @"";
        self.teacherField.text = @"";
        self.roomField.text = @"";
        self.DateField.text = @"";
        self.timeField.text =@"";
    }
    
    
    
    
    
}


@end






