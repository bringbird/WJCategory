//
//  NSDate+WJAdd.h
//
//
//  Created by bringbird on https://github.com/bringbird 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WJAdd)
@property (nonatomic, readonly) NSInteger year;         ///< 年
@property (nonatomic, readonly) NSInteger month;        ///< 月
@property (nonatomic, readonly) NSInteger day;          ///< 日
@property (nonatomic, readonly) NSInteger hour;         ///< 小时
@property (nonatomic, readonly) NSInteger minute;       ///< 分钟
@property (nonatomic, readonly) NSInteger second;       ///< 秒
@property (nonatomic, readonly) NSInteger nanosecond;   ///< 纳秒
@property (nonatomic, readonly) NSInteger weekday;              ///< 周日~周六，1~7
@property (nonatomic, readonly) NSInteger weekdayOrdinal;       ///< WeekdayOrdinal
@property (nonatomic, readonly) NSInteger weekOfMonth;          ///< 当月的周数 (1~5)
@property (nonatomic, readonly) NSInteger weekOfYear;           ///< 当年的周数 (1~53)
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;    ///< YearForWeekOfYear
@property (nonatomic, readonly) NSInteger quarter;  ///< 刻钟 (1小时=4刻钟)
@property (nonatomic, readonly) BOOL isLeapMonth;   ///< 是否是闰月
@property (nonatomic, readonly) BOOL isLeapYear;    ///< 是否是闰年
@property (nonatomic, readonly) BOOL isToday;       ///< 是否是今天
@property (nonatomic, readonly) BOOL isYesterday;   ///< 是否是昨天
@property (nonatomic, readonly) BOOL isOnWeek;      ///< 是否在一周内
@property (nonatomic, readonly) BOOL isLastMonth;   ///< 是否是上个月
@property (nonatomic, readonly) BOOL isThisMonth;   ///< 是否是这个月
@property (nonatomic, readonly) BOOL isNextMonth;   ///< 是否是下个月
@property (nonatomic, readonly) BOOL isLastYear;    ///< 是否是去年
@property (nonatomic, readonly) BOOL isThisYear;    ///< 是否是今年
@property (nonatomic, readonly) BOOL isNextYear;    ///< 是否是明年

/// 是否是当天指定的时间段内
+ (BOOL)isBetweenFromHour:(float)fromHour toHour:(float)toHour;

/// 指定日期加上年
- (NSDate *)dateByAddingYears:(NSInteger)years;

/// 指定日期加上月
- (NSDate *)dateByAddingMonths:(NSInteger)months;

/// 指定日期加上周
- (NSDate *)dateByAddingWeeks:(NSInteger)weeks;

/// 指定日期加上日
- (NSDate *)dateByAddingDays:(NSInteger)days;

/// 指定日期加上小时
- (NSDate *)dateByAddingHours:(NSInteger)hours;

/// 指定日期加上分钟
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;

/// 指定日期加上秒
- (NSDate *)dateByAddingSeconds:(NSInteger)seconds;

/// 时间字符串转时间，frmat：时间格式
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

/// 时间字符串转时间，frmat：时间格式 timeZone：时区，locale：地区
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/// 时间转时间字符串，format：时间格式
- (NSString *)stringWithFormat:(NSString *)format;

/// 星期日~星期六(1~7)
- (NSString *)weekString;

/// 当前时间戳
+ (NSDate *)currentTimesTamp;

/// 时间转时间字符串，format：时间格式 timeZone：时区，locale：地区
- (NSString *)stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

@end
