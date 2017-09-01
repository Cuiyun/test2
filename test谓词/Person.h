//
//  Person.h
//  test谓词
//
//  Created by yuncui on 17/6/19.
//  Copyright © 2017年 PPTV. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZLPersonSex) {
    ZLPersonSexMale = 0,
    ZLPersonSexFamale
};

@interface Person : NSObject
/** NSString 姓名 */
@property (nonatomic, copy) NSString *name;
/** NSUInteger 年龄 */
@property (nonatomic, assign, readonly) NSUInteger age;
/** ZLPersonSex 性别 */
@property (nonatomic, assign, readonly) ZLPersonSex sex;

+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age sex:(ZLPersonSex)sex;

@end
