//
//  AddImageCollectionViewCell.m
//  WeiXInShareDemo
//
//  Created by XuHuan on 16/7/21.
//  Copyright © 2016年 XuHuan. All rights reserved.
//

#import "AddImageCollectionViewCell.h"

@interface AddImageCollectionViewCell ()

@property (strong, nonatomic) UIImageView *imageView;//**<  */

@end

@implementation AddImageCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setCellSubView];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setCellSubView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setCellSubView];
    }
    return self;
}

- (void)setCellSubView {
    self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    [self.contentView addSubview:self.imageView];
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
