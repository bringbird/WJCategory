//
//  WJConst.h
//  WJCategory
//
//  Created by bringbird on 16/8/20.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#ifndef WJConst_h
#define WJConst_h

/****************************  将JSON归档成plist文件  ***************/
#define WJWriteToPlist(fileName) [responseObject writeToFile:[NSString stringWithFormat:@"Users/Work/Desktop/%@.plist",fileName] atomically:YES];


#define WJFunc WJLog(@"%s",__func__)
#ifdef DEBUG
#define WJLog(FORMAT, ...) fprintf(stderr,"[%s %d]:%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define WJLog(FORMAT, ...) nil
#endif

#endif
