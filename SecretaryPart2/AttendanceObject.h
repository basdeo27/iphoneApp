//
//  AttendanceObject.h
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-02.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttendanceObject : NSObject

@property (assign, nonatomic) NSInteger missed;
@property (assign, nonatomic) NSInteger present;
@property (assign, nonatomic) NSTimeInterval time;

@end
