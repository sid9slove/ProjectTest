//
//  Setting.m
//  Planner
//
//  Created by Hanke on 13/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "Setting.h"


#define nameKey @"name"
#define intKey @"int"

@interface Setting ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *intField;

- (IBAction)editBtn:(UIBarButtonItem *)sender;

@end

@implementation Setting

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //add notification center
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.intField];
    
    
    // read last time input
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.nameField.text = [defaults valueForKey:nameKey];
    self.intField.text = [defaults valueForKey:intKey];
   
    
}


- (IBAction)editBtn:(UIBarButtonItem *)sender {
    
    self.nameField.enabled = true;
    self.intField.enabled = true;
    
    
    
}


- (IBAction)save:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameField.text forKey:nameKey];
    [defaults setObject:self.intField.text forKey:intKey];


    [defaults synchronize];
}
@end






#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@property (weak, nonatomic) IBOutlet UISwitch *rembSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginAction;

@end
/*
 plist 需要知道文件名 只适合NSArray，NSString等基本数据类型
 偏好设置 不需要知道文件名，小型数据 NSUserDefaults
 对象归档  NSKeyedArchiver 必须实现NSCoding协议方法
 core Data 大型数据
 sqlite3
 
 */
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    //读取上次配置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.nameField.text = [defaults valueForKey:UserNameKey];
    self.pwdField.text = [defaults valueForKey:PwdKey];
    self.rembSwitch.on = [defaults boolForKey:RmbPwdKey];
    if (self.rembSwitch.isOn) {
        self.pwdField.text = [defaults valueForKey:PwdKey];
        self.loginBtn.enabled = YES;
    }

}
- (void)textChange{
    //修改按钮的点击状态
    //    if (self.nameField.text.length && self.pwdField.text.length) {
    //        self.loginBtn.enabled = YES;
    //    }else{
    //        self.loginBtn.enabled = NO;
    //    }
    //等价于
    self.loginBtn.enabled = (self.nameField.text.length && self.pwdField.text.length);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameField.text forKey:UserNameKey];
    [defaults setObject:self.pwdField.text forKey:PwdKey];
    [defaults setBool:self.rembSwitch.isOn forKey:RmbPwdKey];
    //设置同步
    [defaults synchronize];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameField.text forKey:UserNameKey];
    [defaults setObject:self.pwdField.text forKey:PwdKey];
    [defaults setBool:self.rembSwitch.isOn forKey:RmbPwdKey];
    //设置同步
    [defaults synchronize];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//跳转之前执行
/*
 一般在这里给下一个控制器传值
 这个sender是当初performSegueWithIdentifier方法传入的sender
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //1.取得目标控制器
    UIViewController *contactVc = segue.destinationViewController;
    //2.设置标题（传值）
    contactVc.title = [NSString stringWithFormat:@"%@的联系人列表",self.nameField.text];
}

//登陆
- (IBAction)loginAction {
    if (![self.nameField.text isEqualToString:@"jike"]) {
        [MBProgressHUD showError:@"账号不存在"];
        return;
    }
    if (![self.pwdField.text isEqualToString:@"qq"]) {
        [MBProgressHUD showError:@"密码错误"];
        return;
    }
    //显示蒙版（遮盖）
    [MBProgressHUD showMessage:@"努力加载中"];
    //模拟2秒跳转，以后要发送网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //移除遮盖
        [MBProgressHUD hideHUD];
        [self performSegueWithIdentifier:@"LoginToContact" sender:nil];
    });
    //存储数据
  
}
@end
