//
//  ViewController.m
//  test谓词
//
//  Created by yuncui on 17/6/19.
//  Copyright © 2017年 PPTV. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *num = @5;
    NSString *str = [NSString stringWithFormat:@"%@", num];
    NSString *str2 = @"5";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"%@ >= '5'", str, str2];
    BOOL result = [pre evaluateWithObject:str];
    NSLog(@"%d", result);
    
    UIPanGestureRecognizer *panSign = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didClickSign:)];
    panSign.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:panSign];
    
    [self test5];
}

- (void)test1
{
//    NSPredicate *predict = [NSPredicate predicateWithFormat:@"" arguments:nil];
    
    //  定义一个property来存放属性名，定义一个value来存放值
    NSArray *array = @[[Person personWithName:@"Jack" age:20 sex:ZLPersonSexMale],
                       [Person personWithName:@"Rose" age:22 sex:ZLPersonSexFamale],
                       [Person personWithName:@"Jackson" age:30 sex:ZLPersonSexMale],
                       [Person personWithName:@"Johnson" age:35 sex:ZLPersonSexMale]];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K CONTAINS %@", @"name", @"Jack"];
    NSArray *newArray = [array filteredArrayUsingPredicate:pred];
    NSLog(@"newArray:%@", newArray);
    
    //  创建谓词，属性名改为age，要求这个age包含$VALUE字符串
    NSPredicate *predTemp = [NSPredicate predicateWithFormat:@"%K > $VALUE", @"age"];
    // 指定$VALUE的值为 25
    NSPredicate *pred1 = [predTemp predicateWithSubstitutionVariables:@{@"VALUE" : @25}];
    NSArray *newArray1 = [array filteredArrayUsingPredicate:pred1];
    NSLog(@"newArray1:%@", newArray1);
    
    //  修改 $VALUE的值为32
    NSPredicate *pred2 = [predTemp predicateWithSubstitutionVariables:@{@"VALUE" : @32}];
    NSArray *newArray2 = [array filteredArrayUsingPredicate:pred2];
    NSLog(@"newArray2:%@", newArray2);
}


/**
 复合条件的使用
 */
- (void)test2
{
    NSArray *array = @[[Person personWithName:@"Jack" age:20 sex:ZLPersonSexMale],
                       [Person personWithName:@"Rose" age:22 sex:ZLPersonSexFamale],
                       [Person personWithName:@"Jackson" age:30 sex:ZLPersonSexMale],
                       [Person personWithName:@"Johnson" age:35 sex:ZLPersonSexMale]];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(age > 25) AND (name = %@)", @"Jackson"];
    NSArray *newArray2 = [array filteredArrayUsingPredicate:pred];
    NSLog(@"newArray2:%@", newArray2);
}

- (void)test3
{
    Person *per = [Person personWithName:@"Jack" age:30 sex:ZLPersonSexMale];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(age > %d) AND (name = %@)" argumentArray:@[@25, @"Jack"]];
    
//    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"(state = 1 or 2) AND (view.x > $VALUE)"];
    
    BOOL result = [pred evaluateWithObject:per];
    NSLog(@"%d", result);
}


- (void)test4
{
    NSDictionary *dic = @{ @"age":@30,
                           @"name":@"Jack"
                          };
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(age > %d) AND (name = %@)" argumentArray:@[@25, @"Jack"]];
    
    BOOL result = [pred evaluateWithObject:dic];
    NSLog(@"%d", result);
}

- (void)test5
{
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"]];
    
    NSString *format = dic[@"format"];
    NSArray *arr = [format componentsSeparatedByString:@"&"];
    if (arr.count) {
        //@"%K < %K"
        NSString *str1 = arr[0];
        NSArray *subArr = [arr[1] componentsSeparatedByString:@"|"];
        //@"%K < %K, age, name"
        //@"%K < %K", @"age", @"name"
        NSPredicate *pred = [NSPredicate predicateWithFormat:str1 argumentArray:subArr];
//        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"%K > 30" argumentArray:@[@"height"]];
        BOOL result = [pred evaluateWithObject:dic];
        NSLog(@"%d", result);
    }
}


- (void)didClickSign:(UIPanGestureRecognizer *)gesture
{
    id value = [gesture valueForKeyPath:@"view.frame"];
    NSLog(@"%@", value);
}



@end
