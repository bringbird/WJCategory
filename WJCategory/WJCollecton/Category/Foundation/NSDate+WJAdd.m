//
//  NSDate+WJAdd.m
//  WJCategory
//
//  Created by bringbird on 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "NSDate+WJAdd.h"

@implementation NSDate (WJAdd)
- (NSDateComponents *)compent:(NSCalendarUnit)comp {
    return [[NSCalendar currentCalendar] components:comp fromDate:self];
}

- (NSInteger)year {
    return [[self compent:NSCalendarUnitYear] year];
}

- (NSInteger)month {
    return [[self compent:NSCalendarUnitMonth] month];
}

- (NSInteger)day {
    return [[self compent:NSCalendarUnitDay] day];
}

- (NSInteger)hour {
    return [[self compent:NSCalendarUnitHour] hour];
}

- (NSInteger)minute {
    return [[self compent:NSCalendarUnitMinute] minute];
}

- (NSInteger)second {
    return [[self compent:NSCalendarUnitSecond] second];
}

- (NSInteger)nanosecond {
    return [[self compent:NSCalendarUnitSecond] nanosecond];
}

- (NSInteger)weekday {
    return [[self compent:NSCalendarUnitWeekday] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[self compent:NSCalendarUnitWeekdayOrdinal] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[self compent:NSCalendarUnitWeekOfMonth] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[self compent:NSCalendarUnitWeekOfYear] weekOfYear];
}

- (NSInteger)yearForWeekOfYear {
    return [[self compent:NSCalendarUnitYearForWeekOfYear] yearForWeekOfYear];
}

- (NSInteger)quarter {
    return [[self compent:NSCalendarUnitQuarter] quarter];
}

- (BOOL)isLeapMonth {
    return [[self compent:NSCalendarUnitQuarter] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isYesterday {
    NSDate *added = [self dateByAddingDays:1];
    return [added isToday];
}

- (NSDate *)dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingSeconds:(NSInteger)seconds {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter dateFromString:dateString];
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

- (NSString *)stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter stringFromDate:self];
}

@end 

