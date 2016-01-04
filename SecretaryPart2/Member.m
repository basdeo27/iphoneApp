//
//  Member.m
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-02.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import "Member.h"

@implementation Member



- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.presentTable forKey:@"presentTable"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.position forKey:@"position"];
    [encoder encodeObject:self.year forKey:@"year"];
    [encoder encodeInteger:self.present forKey:@"present"];
    [encoder encodeInteger:self.total forKey:@"total"];
    [encoder encodeInteger:self.late forKey:@"late"];
    [encoder encodeInteger:self.excused forKey:@"excused"];
    [encoder encodeInteger:self.current forKey:@"current"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.presentTable = [decoder decodeObjectForKey:@"presentTable"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.position = [decoder decodeObjectForKey:@"position"];
        self.year = [decoder decodeObjectForKey:@"year"];
        self.present = [decoder decodeIntegerForKey:@"present"];
        self.total = [decoder decodeIntegerForKey:@"total"];
        self.late = [decoder decodeIntegerForKey:@"late"];
        self.excused = [decoder decodeIntegerForKey:@"excused"];
        self.current = [decoder decodeIntegerForKey:@"current"];
    }
    return self;
}

@end
