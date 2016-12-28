//
//  NSObject+WJ.m
//  WJCategory
//
//  Created by 韦明杰 on 2016/9/11.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "NSObject+WJ.h"
#import <YYModel/NSObject+YYModel.h>

@implementation NSObject (WJ)

- (id)modelCopy {
    return  [self yy_modelCopy];
}

- (NSUInteger)modelHash {
    return  [self yy_modelHash];
}

- (id)modelToJSONObject {
    return [self yy_modelToJSONObject];
}

- (NSData *)modelToJSONData {
    return [self yy_modelToJSONData];
}

- (BOOL)modelIsEqual:(id)model {
    return [self yy_modelIsEqual:model];
}

- (NSString *)modelDescription {
    return [self yy_modelDescription];
}

- (NSString *)modelToJSONString {
    return [self yy_modelToJSONString];
}

- (BOOL)modelSetWithJSON:(id)json {
    return [self yy_modelSetWithJSON:json];
}

+ (instancetype)modelWithJSON:(id)json {
    return [self yy_modelWithJSON:json];
}

- (id)modelInitWithCoder:(NSCoder *)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}

- (void)modelEncodeWithCoder:(NSCoder *)aCoder {
    return [self yy_modelEncodeWithCoder:aCoder];
}

- (BOOL)modelSetWithDictionary:(NSDictionary *)dic {
    return [self yy_modelSetWithDictionary:dic];
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    return [self yy_modelWithDictionary:dictionary];
}

@end

@implementation NSArray (WJModel)

+ (NSArray *)modelArrayWithClass:(Class)cls json:(id)json {
    return [self yy_modelArrayWithClass:cls json:json];
}

@end

@implementation NSDictionary (WJModel)

+ (NSDictionary *)modelDictionaryWithClass:(Class)cls json:(id)json {
    return [self yy_modelDictionaryWithClass:cls json:json];
}
@end
