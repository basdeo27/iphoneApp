//
//  AttendanceObject.m
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-02.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import "AttendanceObject.h"

@implementation AttendanceObject

double timeTemp;

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeInteger:self.missed forKey:@"missed"];
    [encoder encodeInteger:self.present forKey:@"present"];
    timeTemp = (double) self.time;
    [encoder encodeDouble: timeTemp forKey:@"time"];

}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.missed = [decoder decodeIntegerForKey:@"missed"];
        self.present = [decoder decodeIntegerForKey:@"present"];
        timeTemp = [decoder decodeDoubleForKey:@"time"];
        self.time = (NSTimeInterval) timeTemp;
    }
    return self;
}


@end
