//
//  AddViewController.h
//  Study
//
//  Created by Hanke on 19/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddViewController, SubjectModel;
@protocol AddViewControllerDelegate <NSObject>

@optional
- (void)addSubject:(AddViewController *)addVc didAdd: (SubjectModel *)subject;

@end

@interface AddViewController : UIViewController

@property (nonatomic, assign)id <AddViewControllerDelegate> delegate;

@end
