//
//  ShareViewController.m
//  WeiXInShareDemo
//
//  Created by XuHuan on 16/7/21.
//  Copyright © 2016年 XuHuan. All rights reserved.
//

#import "ShareViewController.h"
#import "AddImageCollectionView.h"

@interface ShareViewController ()<AddImageCollectionViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collection;
@property (weak, nonatomic) IBOutlet AddImageCollectionView *addInmageCollectionView;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collection.constant = [UIScreen mainScreen].bounds.size.width / 4.0;
    self.addInmageCollectionView.theViewController = self;
    self.addInmageCollectionView.imageDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    self.height.constant = [UIScreen mainScreen].bounds.size.height - 63;
}

#pragma mark - AddImageCollectionView
- (void)addImageCollectionView:(AddImageCollectionView *)addImageCollectionView finishAddImage:(NSArray *)imageArr {
    if (imageArr.count >= 8) {
        self.collection.constant = [UIScreen mainScreen].bounds.size.width / 4.0 * 3;
    } else if (imageArr.count >= 4){
        self.collection.constant = [UIScreen mainScreen].bounds.size.width / 4.0 * 2;
    }
}

@end
