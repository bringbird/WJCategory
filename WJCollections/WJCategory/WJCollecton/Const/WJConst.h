//
//  WJConst.h
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#ifndef WJConst_h
#define WJConst_h

#define WJFunc WJLog(@"%s",__func__)

#ifdef DEBUG
    #define WJLog(FORMAT, ...) fprintf(stderr,"[%s %d]:%s\n",\
        [[[NSString stringWithUTF8String:__FILE__] \
        lastPathComponent] UTF8String], __LINE__, \
        [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
    #define WJLog(FORMAT, ...) nil;
#endif


#define dispatch_async_main_safe(block) [NSThread isMainThread]?block():dispatch_async(dispatch_get_main_queue(), block);\}

#define end_Editing [self.view  endEditing:YES];

#endif
