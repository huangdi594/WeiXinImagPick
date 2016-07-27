//
//  AddImageCollectionView.h
//  WeiXInShareDemo
//
//  Created by XuHuan on 16/7/21.
//  Copyright © 2016年 XuHuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddImageCollectionView;
@protocol AddImageCollectionViewDelegate <NSObject>

- (void)addImageCollectionView:(AddImageCollectionView *)addImageCollectionView finishAddImage:(NSArray *)imageArr;

@end

@interface AddImageCollectionView : UICollectionView

@property (weak, nonatomic) UIViewController *theViewController;
@property (weak, nonatomic) id<AddImageCollectionViewDelegate> imageDelegate;

@end
