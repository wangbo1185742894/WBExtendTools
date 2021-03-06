//
//  DateTimeTools.h
//  WBExtendTools
//
//  Created by Azir on 2019/7/22.
//  Copyright © 2019 Azir. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateTimeTools : NSObject


/**
 *  获取当前时间戳
 */
+ (NSString *)getTimestampNowString;


/**
 *  获取明天0点时间戳
 */
+ (NSString *)getTimestampZore;


/**
 *  获取当前时间若干天之后的时间戳
 *  @param day 天数
 *  @return 时间戳
 */
+ (NSString *)getTimestampLongDay:(NSInteger)day;


/**
 *  与当前时间比较格式化返回，例如：刚刚，5分钟前等
 *  @param compareDate 待比对的时间字符串
 *  @return 比对结果
 */
+ (NSString *)compareCurrentTime:(NSString *)compareDate;


/**
 *  与当前时间比较格式化返回，例如：08：56，2016/08/30 08：56等
 *  @param dateStr 待比对的时间字符串
 *  @return 比对结果
 */
+ (NSString *)compareDate:(NSString *)dateStr;


/**
 *  时间差
 *  @param date 时间
 *  @param otherDate 时间
 *  @return 时间差（秒）
 */
+ (NSInteger)compareTimeDifferenceDate:(NSDate *)date otherDate:(NSDate *)otherDate;


/**
*  比较两个时间差值是否在自定义分钟范围内
*  @param minute 时间差值范围（分钟）
*  @param date 时间
*  @param otherDate 时间
*  @return 是否在这个范围
*/
+ (BOOL)compareTimeDifferenceValueIsRangeMinute:(double)minute fromDate:(NSString *)date otherDate:(NSString *)otherDate;


/**
 *  判断是不是今天
 *  @param date 带比对时间
 *  @return BOOL值 0/1
 */
+ (BOOL)isToday:(NSDate *)date;


/**
 *  判断是不是今天
 *  @param dateString 带比对时间
 *  @return BOOL值 0/1
 */
+ (BOOL)isTodayWithString:(NSString *)dateString;


/**
 *  判断是不是昨天
 *  @param dateString 带比对时间
 *  @return BOOL值 0/1
 */
+ (BOOL)isYersterday:(NSString *)dateString;


/**
 *  判断是不是今年
 *  @param dateString 带比对时间
 *  @return BOOL值 0/1
 */
+ (BOOL)isThisYear:(NSString *)dateString;


/**
 *  判断是否本月
 *  @param dateString 带比对时间
 *  @return BOOL值 0/1
 */
+ (BOOL)isThisMonth:(NSString *)dateString;


/**
 *  获取年份
 *  @param dateString 时间
 *  @return 年份
 */
+ (NSString *)year:(NSString *)dateString;


/// 获取今年
+ (NSString *)year;

/// 获取当月
+ (NSString *)month;


/**
 *  获取MM月
 *  @param dateString 时间
 *  @return MM月
 */
+ (NSString *)month:(NSString *)dateString;


/**
 *  获取当前月天数
 *  @return 当前月天数
 */
+ (NSInteger )dateNumber;


/**
 *  获取当前时间(天数)
 *  @return 当前时间
 */
+ (NSString *)toDay;


/**
 *  获取当前时间 年-月-日
 *  @return yyyy年MM月
 */
+ (NSString *)yearAndMonthAndDay;


/**
 *  获取当前时间 年-月-日 时：分：秒
 *  @return yyyy年MM月
 */
+ (NSString *)nowTimeDetails;


/**
 *  获取yyyy-MM
 *  @return yyyy年MM月
 */
+ (NSString *)yearAndMonth;


/**
 *  获取MM-dd
 *  @param dateString 时间
 *  @return MM-dd
 */
+ (NSString *)monthAndDay:(NSString *)dateString;


/**
 *  获取HH:ss
 *  @param dateString 时间
 *  @return HH:ss
 */
+ (NSString *)hourAndMinute:(NSString *)dateString;


/**
 *  获取星期
 *  @param dateString 时间
 *  @return 星期
 */
+ (NSString *)weekDayFromDateString:(NSString *)dateString;



/**
 *  时间戳转为时间 年月日
 *  @param timeStamp 时间戳
 *  @return 星期
 */
+ (NSString *)dateFromTimestamp:(NSString *)timeStamp;


/**
 *  时间戳转为时间 年月日时分秒
 *  @param timeStamp 时间戳
 *  @return 星期
 */
+ (NSString *)dateFromTimestampDetails:(NSString *)timeStamp;


/**
 *  秒转换时分秒
 *  @param totalTime 秒
 *  @return 时分秒
 */
+ (NSString *)getMMSSFromSS:(NSString *)totalTime;


/**
 *  倒计时
 *  @param totalTime 秒
 *  @return 时分秒
 */
+ (NSString *)getDDMMSSFromSS:(NSString *)totalTime;


/**
 *  时间转换时间戳
 *  @param formatTime 秒
 *  @return 时分秒
 */
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

/**
 比较两个日期大小

 @param date01 格式 2013-08-05
 @param date02 格式 2013-08-05
 @return 0/1/-1 相等/02比01大/02比01小
 */
+ (int)compareDate:(NSString*)date01 withDate:(NSString*)date02;

@end

NS_ASSUME_NONNULL_END
