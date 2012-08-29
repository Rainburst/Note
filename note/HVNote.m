//
//  HVNote.m
//  note
//
//  Created by Nikita Ilyasov on 29.08.12.
//  Copyright (c) 2012 Hex Violet. All rights reserved.
//

#import "HVNote.h"
#import <AppKit/AppKit.h>

static NSString * const kDateKey = @"kDateKey";
static NSString * const kTextKey = @"kTextKey";
static NSString * const kTypeKey = @"kTypeKey";
@implementation HVNote
-(id)initWithText:(NSString *)text {
    self = [super init];
    if(self) {
        self.text = text;
        NSURL * url = [NSURL URLWithString:self.text];
        if(url) {
            self.type = kURLType;
        } else {
            self.type = kTextType;
        }
        self.date = [NSDate date];
    }
    return self;
}
-(void)open {
    if([self.type isEqualToString:kURLType])
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:self.text]];
    else
        NSLog(@"not an url");
}


-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.text forKey:kTextKey];
    [aCoder encodeObject:self.date forKey:kDateKey];
    [aCoder encodeObject:self.type forKey:kTypeKey];
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.text = [aDecoder decodeObjectForKey:kTextKey];
        self.date = [aDecoder decodeObjectForKey:kDateKey];
        self.type = [aDecoder decodeObjectForKey:kTypeKey];
    }
    return self;
}
-(NSString *)description {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];

    
    NSString *formattedDateString = [dateFormatter stringFromDate:self.date];
    return [NSString stringWithFormat:@"Text:%@ Date:%@\n",self.text,formattedDateString];
}
@end
