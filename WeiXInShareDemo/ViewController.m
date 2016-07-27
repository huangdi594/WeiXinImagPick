//
//  ViewController.m
//  WeiXInShareDemo
//
//  Created by XuHuan on 16/7/21.
//  Copyright © 2016年 XuHuan. All rights reserved.
//

#import "ViewController.h"
#import "ShareViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)present:(id)sender {
    ShareViewController *share = [[UIStoryboard storyboardWithName:@"ShareStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"ShareViewController"];
    [self presentViewController:share animated:YES completion:nil];
}

@end
