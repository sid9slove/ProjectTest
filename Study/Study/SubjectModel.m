//
//  SubjectModel.m
//  Study
//
//  Created by Hanke on 20/07/15.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

#import "SubjectModel.h"

@implementation SubjectModel

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.subject forKey:@"subject"];
    [encoder encodeObject:self.teacher forKey:@"teacher"];
    [encoder encodeObject:self.room forKey:@"room"];
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeObject:self.time forKey:@"time"];
}


- (id)initWithCoder: (NSCoder *)decoder{
    if (self = [super init]) {
        self.subject = [decoder decodeObjectForKey:@"subject"];
        self.teacher = [decoder decodeObjectForKey:@"teacher"];
        self.room = [decoder decodeObjectForKey:@"room"];
        self.date = [decoder decodeObjectForKey:@"date"];
        self.time = [decoder decodeObjectForKey:@"time"];
    }
    return self;
}

@end
