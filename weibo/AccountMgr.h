//
//  AccountMgr.h
//  weibo
//
//  Created by dingql on 14-8-13.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@class Account;
@interface AccountMgr : NSObject
singleton_interface(AccountMgr)

@property(nonatomic, strong) NSMutableArray * accounts;
@property(nonatomic, strong) Account * currentAccount;

- (void)saveAccounts;
- (void)loadAccounts;
- (void)addAccount:(Account *)account;
@end
