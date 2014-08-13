//
//  AccountMgr.m
//  weibo
//
//  Created by dingql on 14-8-13.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "AccountMgr.h"

@implementation AccountMgr
singleton_implementation(AccountMgr)

- (id)init
{
    if (self = [super init]) {
        [self loadAccounts];
    }
    
    return self;
}

- (void)saveAccounts
{
    NSString * path = [kDocumentPath stringByAppendingPathComponent:@"accounts.dat"];
    
    NSMutableData * data = [NSMutableData data];
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:_accounts forKey:@"accounts"];
    [archiver encodeObject:_currentAccount forKey:@"current_account"];
    [archiver finishEncoding];
    
    [data writeToFile:path atomically:YES];
}

- (void)loadAccounts
{
    NSString * path = [kDocumentPath stringByAppendingPathComponent:@"accounts.dat"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData * data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver * unArchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        self.accounts = [unArchiver decodeObjectForKey:@"accounts"];
        self.currentAccount = [unArchiver decodeObjectForKey:@"current_account"];
        [unArchiver finishDecoding];
    } else {
        self.accounts = [[NSMutableArray alloc]initWithCapacity:10];
    }
}

- (void)addAccount:(Account *)account
{
    if (account) {
        [self.accounts addObject:account];
        self.currentAccount = account;
    }
}

@end
