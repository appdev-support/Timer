//
//  ViewController.m
//  Timer
//
//  Created by 李晋 on 2017/6/16.
//  Copyright © 2017年 李晋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, readwrite, strong) NSTimer *timer;
@property (nonatomic, readwrite, assign) NSInteger logTime;
@end
static NSTimeInterval sec = 1.0;
@implementation ViewController
- (IBAction)action:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        [self invalidateTimer];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"完成" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    __weak typeof(self) weakSelf = self;
    [self presentViewController:alert animated:YES completion:^{
        [weakSelf timerBegin];
    }];
}

- (void)timerBegin {
    if (self.timer) {
        [self invalidateTimer];
    }
    self.logTime = 3;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:sec repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.logTime--;
        NSLog(@"%ld", (long)self.logTime);
        if (!self.logTime) {
            [self invalidateTimer];
        }
    }];
    [self.timer fire];
}

- (void)invalidateTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
