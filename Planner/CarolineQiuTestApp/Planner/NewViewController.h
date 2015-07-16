//
//  NewViewController.h
//  Planner
//
//  Created by Hanke on 14/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewViewController, SubjectModle;
@protocol NewViewControllerDelegate <NSObject>

@optional
-(void)addSubject:(NewViewController *)addVC didAddSubject:(SubjectModle *)subject;

@end
@interface NewViewController : UIViewController

@property (nonatomic, assign) id<NewViewControllerDelegate> delegate;

@end





//@optional
//- (void)addContact:(AddViewController *)addVc didAddContact:(JKContactModel *)contact;
//@property (nonatomic, assign) id<AddViewControllerDelegate> delegate;
