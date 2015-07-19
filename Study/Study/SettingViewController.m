//
//  SettingViewController.m
//  Study
//
//  Created by Hanke on 19/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "SettingViewController.h"

#define NameKey @"name"
#define IntKey @"int"

@interface SettingViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *intField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;

@property (weak, nonatomic) IBOutlet UIButton *doneBtn;


- (IBAction)doneAction;

- (IBAction)editAction:(id)sender;

@end

@implementation SettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //add notification center
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.intField];
    

    //reading last time input
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.nameField.text = [defaults valueForKey:NameKey];
    self.intField.text = [defaults valueForKey:IntKey];
  
  
    
}



- (void)textChanged {
    
    self.doneBtn.enabled = (self.nameField.text.length && self.intField.text.length);
    
    
}

- (IBAction)doneAction {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameField.text forKey:NameKey];
    [defaults setObject:self.intField.text forKey:IntKey];
    [defaults synchronize];
}

- (IBAction)editAction:(id)sender {
    
    self.nameField.enabled = true;
    self.intField.enabled = true;
}



@end
