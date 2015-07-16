//
//  SubjectModle.m
//  Planner
//
//  Created by Hanke on 16/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "SubjectModle.h"

@implementation SubjectModle


- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.subject forKey:@"subject"];
    [encoder encodeObject:self.teacher forKey:@"teacher"];
    [encoder encodeObject:self.room forKey:@"room"];
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeObject:self.time1 forKey:@"time1"];
    
}

- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.subject = [decoder decodeObjectForKey:@"subject"];
        self.teacher = [decoder decodeObjectForKey:@"teacher"];
        self.room = [decoder decodeObjectForKey:@"room"];
        self.date = [decoder decodeObjectForKey:@"date"];
        self.time1 = [decoder decodeObjectForKey:@"time1"];
    }
    return self;
}


@end