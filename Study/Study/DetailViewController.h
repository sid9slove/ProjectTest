//
//  DetailViewController.h
//  Study
//
//  Created by Hanke on 19/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SubjectModel,DetailViewController;
@protocol DetailViewControllerDelegate <NSObject>

@optional
- (void)editeViewController:(DetailViewController *)editVc savedSub:(SubjectModel *)model;

@end
@interface DetailViewController : UIViewController
@property (nonatomic, assign) id<DetailViewControllerDelegate> delagate;
@property(nonatomic, strong) SubjectModel *subModel;
@end
