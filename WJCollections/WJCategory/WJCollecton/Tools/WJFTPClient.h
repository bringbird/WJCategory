//
//  WJFTPClient.h
//  WJCategory
//
//  Created by 韦明杰 on 2017/4/6.
//  Copyright © 2017年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJFTPClient : NSObject
@property (nonatomic,copy) NSURL *serverURL;
@property (nonatomic,copy) NSURL *localFileURL;
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,assign) NSInteger finishedSize;
@property (nonatomic,assign) NSInteger totalSize;

@property (nonatomic,copy) void (^progressAction)(NSInteger totalSize, NSInteger finishedSize);
@property (nonatomic,copy) void (^successAction)(Class resultClass, id result);
@property (nonatomic,copy) void (^failAction)(NSError *error);

- (BOOL)start;
- (void)stop;
@end

@interface WJFTPClient (WJ)

+ (WJFTPClient *)resourceListRequest;
+ (WJFTPClient *)downloadRequest;
+ (WJFTPClient *)uploadRequest;
+ (WJFTPClient *)createResourceRequest;
+ (WJFTPClient *)destoryResourceRequest;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end
