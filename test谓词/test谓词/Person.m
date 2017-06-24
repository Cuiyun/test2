//
//  Person.m
//  test谓词
//
//  Created by yuncui on 17/6/19.
//  Copyright © 2017年 PPTV. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age sex:(ZLPersonSex)sex
{
    if (self = [super init]) {
        _name = name;
        _age = age;
        _sex = sex;
    }
    return self;
}

+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age sex:(ZLPersonSex)sex
{
    return [[self alloc] initWithName:name age:age sex:sex];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"[name = %@, age = %ld, sex = %ld]", self.name, self.age, self.sex];
}
@end
