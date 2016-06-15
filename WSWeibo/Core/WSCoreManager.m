//
//  WSCoreManager.m
//  WSWeibo
//
//  Created by wackosix on 16/6/12.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

#import "WSCoreManager.h"

@interface WSCoreManager ()

@property (nonatomic, copy) AlertCompletedBlock alertCancel;
@property (nonatomic, copy) AlertCompletedBlock alertConfirm;

@end

@implementation WSCoreManager


- (id)showAlert:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(AlertCompletedBlock)cancel confirmTitle:(NSString *)confirmTitle confirmBlock:(AlertCompletedBlock)confirm
{
    self.alertConfirm = confirm;
    self.alertCancel = cancel;
    if (confirmTitle == nil)
    {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:title == nil ? @"":title message:message == nil ? @"":message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:nil];
        [av show];
        return av;
    }
    else
    {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:title == nil ? @"":title message:message == nil ? @"":message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:confirmTitle, nil];
        [av show];
        return av;
    }
    return nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        if (self.alertCancel) {
            self.alertCancel();
            self.alertCancel = nil;
        }
    }else if (buttonIndex == 1){
        if (self.alertConfirm) {
            self.alertConfirm();
            self.alertConfirm = nil;
        }
    }
}

@end
