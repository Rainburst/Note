//
//  main.m
//  note
//
//  Created by Nikita Ilyasov on 29.08.12.
//  Copyright (c) 2012 Hex Violet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HVNote.h"
#import "HVNoteRepository.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
       // [HVNoteRepository initialize];
        
        HVNoteRepository * repo = [HVNoteRepository newHVNoteRepository];
//        for(int i = 1; i< argc; i++) {
//            NSLog(@"(%@)",[NSString stringWithUTF8String:argv[i]]);
//        }
//        
//        NSLog(@"%i",argc);
        switch (argc) {
            case 1:
                printf("%s\n",repo.description.UTF8String);
                break;
            case 2: {
                NSString * arg = [NSString stringWithUTF8String:argv[1]];
                
                if([arg isEqualToString:@"list"]){
                    [repo list];
                }else
                if([arg isEqualToString:@"pop"]){
                    HVNote * note = [repo pop];
                    [note open];
                    printf("%s\n",note.description.UTF8String);
                }else
                if([arg isEqualToString:@"last"]){
                    HVNote * note = [repo last];
                    [note open];
                    printf("%s\n",note.description.UTF8String);
                }else
                if([arg isEqualToString:@"reset"]){
                    [repo reset];
                }else {
                    [repo push:[[HVNote alloc] initWithText:arg]];
                }
                break;
            }
            case 3:
                if([[NSString stringWithUTF8String:argv[1]] isEqualToString:@"add"]){
                    [repo push:[[HVNote alloc] initWithText:[NSString stringWithUTF8String:argv[2]]]];
                }
                break;
            default:
                break;
        }
        
    }
    return 0;
}

