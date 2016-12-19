//
//  NSObject+WJAdd.h
//  WJCategory
//
//  Created by 韦明杰 on 2016/9/11.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WJAdd)

/**
 Copy a instance with the receiver's properties.

 @return A copied instance, or nil if an error occurs.
 */
- (nullable id)modelCopy;

/**
 Get a hash code with the receiver's properties.
 
 @return Hash code.
 */
- (NSUInteger)modelHash;

/**
 Description method for debugging purposes based on properties.
 
 @return A string that describes the contents of the receiver.
 */
- (NSString *)modelDescription;

/**
 Compares the receiver with another object for equality, based on properties.
 
 @param model  Another object.
 
 @return `YES` if the reciever is equal to the object, otherwise `NO`.
 */
- (BOOL)modelIsEqual:(id)model;

/**
 Generate a json object from the receiver's properties.
 
 @return A json object in `NSDictionary` or `NSArray`, or nil if an error occurs.
 See [NSJSONSerialization isValidJSONObject] for more information.
 
 @discussion Any of the invalid property is ignored.
 If the reciver is `NSArray`, `NSDictionary` or `NSSet`, it just convert
 the inner object to json object.
 */
- (nullable id)modelToJSONObject;

/**
 Set the receiver's properties with a json object.
 
 @discussion Any invalid data in json will be ignored.
 
 @param json  A json object of `NSDictionary`, `NSString` or `NSData`, mapped to the
 receiver's properties.
 
 @return Whether succeed.
 */
- (BOOL)modelSetWithJSON:(id)json;

/**
 Generate a json string's data from the receiver's properties.
 
 @return A json string's data, or nil if an error occurs.
 
 @discussion Any of the invalid property is ignored.
 If the reciver is `NSArray`, `NSDictionary` or `NSSet`, it will also convert the
 inner object to json string.
 */
- (nullable NSData *)modelToJSONData;

/**
 Generate a json string from the receiver's properties.
 
 @return A json string, or nil if an error occurs.
 
 @discussion Any of the invalid property is ignored.
 If the reciver is `NSArray`, `NSDictionary` or `NSSet`, it will also convert the
 inner object to json string.
 */
- (nullable NSString *)modelToJSONString;

/**
 Decode the receiver's properties from a decoder.
 
 @param aDecoder  An archiver object.
 
 @return self
 */
- (id)modelInitWithCoder:(NSCoder *)aDecoder;

/**
 Encode the receiver's properties to a coder.
 
 @param aCoder  An archiver object.
 */
- (void)modelEncodeWithCoder:(NSCoder *)aCoder;

/**
 Creates and returns a new instance of the receiver from a json.
 
 @param json  A json object in `NSDictionary`, `NSString` or `NSData`.
 
 @return A new instance created from the json, or nil if an error occurs.
 */
+ (nullable instancetype)modelWithJSON:(id)json;

/**
 Set the receiver's properties with a key-value dictionary.
 
 @param dic  A key-value dictionary mapped to the receiver's properties.
 Any invalid key-value pair in dictionary will be ignored.
 
 @discussion The key in `dictionary` will mapped to the reciever's property name,
 and the value will set to the property. If the value's type doesn't match the
 property, this method will try to convert the value based on these rules:
 
 `NSString`, `NSNumber` -> c number, such as BOOL, int, long, float, NSUInteger...
 `NSString` -> NSDate, parsed with format "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd".
 `NSString` -> NSURL.
 `NSValue` -> struct or union, such as CGRect, CGSize, ...
 `NSString` -> SEL, Class.
 
 @return Whether succeed.
 */
- (BOOL)modelSetWithDictionary:(NSDictionary *)dic;

/**
 Creates and returns a new instance of the receiver from a key-value dictionary.
 
 @param dictionary  A key-value dictionary mapped to the instance's properties.
 Any invalid key-value pair in dictionary will be ignored.
 
 @return A new instance created from the dictionary, or nil if an error occurs.
 
 @discussion The key in `dictionary` will mapped to the reciever's property name,
 and the value will set to the property. If the value's type does not match the
 property, this method will try to convert the value based on these rules:
 
 `NSString` or `NSNumber` -> c number, such as BOOL, int, long, float, NSUInteger...
 `NSString` -> NSDate, parsed with format "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd".
 `NSString` -> NSURL.
 `NSValue` -> struct or union, such as CGRect, CGSize, ...
 `NSString` -> SEL, Class.
 */
+ (nullable instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end

@interface NSArray (WJModel)

/**
 Creates and returns an array from a json-array.
 
 @param cls  The instance's class in array.
 @param json  A json array of `NSArray`, `NSString` or `NSData`.
 Example: [{"name","Mary"},{name:"Joe"}]
 
 @return A array, or nil if an error occurs.
 */
+ (nullable NSArray *)modelArrayWithClass:(Class)cls json:(id)json;

@end

@interface NSDictionary (WJModel)

/**
 Creates and returns a dictionary from a json.
 
 @param cls  The value instance's class in dictionary.
 @param json  A json dictionary of `NSDictionary`, `NSString` or `NSData`.
 Example: {"user1":{"name","Mary"}, "user2": {name:"Joe"}}
 
 @return A dictionary, or nil if an error occurs.
 */
+ (nullable NSDictionary *)modelDictionaryWithClass:(Class)cls json:(id)json;

@end

NS_ASSUME_NONNULL_END
