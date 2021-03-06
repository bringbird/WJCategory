//
//  NSDate+WJ.m
//
//
//  Created by bringbird on https://github.com/bringbird 16/8/21.
//  Copyright © 2016年 韦明杰. All rights reserved.
//

#import "NSDate+WJ.h"

@implementation NSDate (WJ)
    
- (NSInteger)daysFromNow {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *oldDate = [dateFormatter dateFromString:[self stringWithFormat:@"yyyy-MM-dd"]];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSCalendarUnitDay;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:oldDate  toDate:[NSDate date]  options:0];
    return [comps day];
}

- (NSDateComponents *)compents:(NSCalendarUnit)comp {
    return [[NSCalendar currentCalendar] components:comp fromDate:self];
}

- (NSInteger)year {
    return [[self compents:NSCalendarUnitYear] year];
}

- (NSInteger)month {
    return [[self compents:NSCalendarUnitMonth] month];
}

- (NSInteger)day {
    return [[self compents:NSCalendarUnitDay] day];
}

- (NSInteger)hour {
    return [[self compents:NSCalendarUnitHour] hour];
}

- (NSInteger)minute {
    return [[self compents:NSCalendarUnitMinute] minute];
}

- (NSInteger)second {
    return [[self compents:NSCalendarUnitSecond] second];
}

- (NSInteger)nanosecond {
    return [[self compents:NSCalendarUnitSecond] nanosecond];
}

- (NSInteger)weekday {
    return [[self compents:NSCalendarUnitWeekday] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[self compents:NSCalendarUnitWeekdayOrdinal] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[self compents:NSCalendarUnitWeekOfMonth] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[self compents:NSCalendarUnitWeekOfYear] weekOfYear];
}

- (NSInteger)yearForWeekOfYear {
    return [[self compents:NSCalendarUnitYearForWeekOfYear] yearForWeekOfYear];
}

- (NSInteger)quarter {
    return [[self compents:NSCalendarUnitQuarter] quarter];
}

- (BOOL)isLeapMonth {
    return [[self compents:NSCalendarUnitQuarter] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isOnWeek {
    return (self.second - NSDate.new.second) <= (60 * 60 * 24 * 7);
}

- (BOOL)isYesterday {
    NSDate *added = [self dateByAddingDays:1];
    return added.isToday;
}

- (BOOL)isLastMonth {
    if (!self.isThisYear) return NO;
    NSUInteger added = [[NSDate new] dateByAddingMonths:-1].month;
    NSUInteger now = self.month;
    return now == added;
}

- (BOOL)isThisMonth {
    if (!self.isThisYear) return NO;
    NSUInteger added = [[NSDate new] dateByAddingMonths:0].month;
    NSUInteger now = self.month;
    return now == added;
}

- (BOOL)isNextMonth {
    if (!self.isThisYear) return NO;
    NSUInteger added = [[NSDate new] dateByAddingMonths:1].month;
    NSUInteger now = self.month;
    return now == added;
}

- (BOOL)isLastYear {
    NSUInteger added = [[NSDate new] dateByAddingYears:-1].year;
    NSUInteger now = self.year;
    return now == added;
}

- (BOOL)isThisYear {
    NSUInteger added = [[NSDate new] dateByAddingYears:0].year;
    NSUInteger now = self.year;
    return now == added;
}

- (BOOL)isNextYear {
    NSUInteger added = [[NSDate new] dateByAddingYears:1].year;
    NSUInteger now = self.year;
    return now == added;
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

- (NSString *)weekString {
    return [self cherater:self.weekday];
}

- (NSString *)cherater:(NSInteger)inte {
    NSString *day;
    switch (inte) {
        case 1: day = @"星期日"; break;
        case 2: day = @"星期一"; break;
        case 3: day = @"星期二"; break;
        case 4: day = @"星期三"; break;
        case 5: day = @"星期四"; break;
        case 6: day = @"星期五"; break;
        case 7: day = @"星期六"; break;
        default: break;
    }
    return day;
}

+ (NSDate *)currentTimesTamp {
    return [self dateWithTimeIntervalSinceNow:0];
}

- (NSString *)stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter stringFromDate:self];
}


+ (BOOL)isBetweenFromHour:(float)fromHour toHour:(float)toHour {
    NSDate *from = [self getCustomDateWithHour:fromHour];
    NSDate *to   = [self getCustomDateWithHour:toHour];
    NSDate *now  = [NSDate date];
    if ([now compare:from] == NSOrderedDescending && [now compare:to]==NSOrderedAscending) {
        return YES;
    }
    return NO;
}


+ (NSDate *)getCustomDateWithHour:(float)hour {
    
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setMinute:hour * 60];
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    return [resultCalendar dateFromComponents:resultComps];
}
@end

