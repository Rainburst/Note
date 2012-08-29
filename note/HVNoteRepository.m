//
//  HVNoteRepository.m
//  note
//
//  Created by Nikita Ilyasov on 29.08.12.
//  Copyright (c) 2012 Hex Violet. All rights reserved.
//

#import "HVNoteRepository.h"
static NSString * const kSelfKey = @"kSelfKey";
static NSString * const kNoteHolderKey = @"kNoteHolderKey";

@interface HVNoteRepository () {
    NSMutableArray * noteHolder;
}
@property(strong,nonatomic) NSMutableArray * noteHolder;
@end

@implementation HVNoteRepository
@synthesize noteHolder;
+(HVNoteRepository *)newHVNoteRepository {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:kSelfKey]];
}
+(void)initialize {
    [[NSUserDefaults standardUserDefaults] synchronize];
    HVNoteRepository * me = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:kSelfKey]];
    if(!me) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:[HVNoteRepository new]] forKey:kSelfKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

-(id)init {
    self = [super init];
    if(self)
        noteHolder = [NSMutableArray new];
    
    return self;
}

-(void)dealloc {
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self] forKey:kSelfKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(HVNote *)pop {
    HVNote * result = [noteHolder lastObject];
    if(result) {
        [noteHolder removeLastObject];
    }
    return result;
}

-(void)list {
    if(!noteHolder.count) {
        printf("%s\n","no notes");
        return;
    }
    for (HVNote * note in noteHolder) {
        printf("%s\n",note.description.UTF8String);
    }
}

-(HVNote *)last {
    return [noteHolder lastObject];
}

-(void)push:(HVNote *)note  {
    [noteHolder addObject:note];
}

-(void)reset {
    [noteHolder removeAllObjects];
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:noteHolder forKey:kNoteHolderKey];
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.noteHolder = [aDecoder decodeObjectForKey:kNoteHolderKey];
    }
    return self;
}

-(NSString *)description {
    if(noteHolder.count > 0) {
        return [[noteHolder lastObject] description];
    } else {
        return @"0 notes found\ntry 'note help' to see the usage\n";
    }
}
@end
