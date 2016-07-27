//
//  AddImageCollectionView.m
//  WeiXInShareDemo
//
//  Created by XuHuan on 16/7/21.
//  Copyright © 2016年 XuHuan. All rights reserved.
//

#import "AddImageCollectionView.h"
#import "AddImageCollectionViewCell.h"
#import "XHImagePicker.h"

#define ImageWidth  (([UIScreen mainScreen].bounds.size.width - 40) / 4.0 - 10)
static NSString * CellIdentifier = @"GradientCell";

@interface AddImageCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSMutableArray *imageArr;//**<  */

@end

@implementation AddImageCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        [self registerClass:[AddImageCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        [self setDelegates];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        [self registerClass:[AddImageCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        [self setDelegates];
    }
    return self;
}

- (void)setDelegates {
    self.dataSource = self;
    self.delegate = self;
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArr.count == 9 ? self.imageArr.count : self.imageArr.count + 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    AddImageCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (indexPath.row == self.imageArr.count ) {
        cell.image = [UIImage imageNamed:@"takePhoto"];
    } else {
        cell.image = self.imageArr[indexPath.row];
    }
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ImageWidth, ImageWidth);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 20, 5, 20);
}
#pragma mark --UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    __block AddImageCollectionView *weekSelf = self;
    if (indexPath.row == self.imageArr.count) {//选择图片
        [XHImagePicker showImagePickerFromViewController:self.theViewController allowsVideo:NO maxCount:9 - self.imageArr.count finishAction:^(NSArray *imageArr) {
            //获取图片刷新collectionView
            [weekSelf.imageArr addObjectsFromArray:imageArr];
            [weekSelf reloadData];
            //告诉代理修改界面效果
            if ([weekSelf.imageDelegate respondsToSelector:@selector(addImageCollectionView:finishAddImage:)]) {
                [weekSelf.imageDelegate addImageCollectionView:weekSelf finishAddImage:imageArr];
            }
        }];
    } else {//放大选中图片
        
    }
}

- (NSMutableArray *)imageArr {
    if (!_imageArr) {
        _imageArr = [[NSMutableArray alloc] init];
    }
    return _imageArr;
}

@end
