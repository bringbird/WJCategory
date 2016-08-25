//
//  UIApplication+WJAdd.h
//  WJCategory
//
//  Created by bringbird on 16/8/22.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIApplication (WJAdd)

/// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *documentsURL;
@property (nonatomic, readonly) NSString *documentsPath;

/// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *cachesURL;
@property (nonatomic, readonly) NSString *cachesPath;

/// "Library" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *libraryURL;
@property (nonatomic, readonly) NSString *libraryPath;

/// Application's Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString *appBundleName;

/// Application's Bundle ID.  e.g. "com.bringbird"
@property (nullable, nonatomic, readonly) NSString *appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString *appVersion;

/// Application's Build number. e.g. "123"
@property (nullable, nonatomic, readonly) NSString *appBuildVersion;

+ (void)showNetWorkActivityIndicator;

+ (void)hidNetWorkActivityIndicator;

@end
NS_ASSUME_NONNULL_END