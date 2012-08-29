//
//  HVNoteRepository.h
//  note
//
//  Created by Nikita Ilyasov on 29.08.12.
//  Copyright (c) 2012 Hex Violet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HVNote.h"
@interface HVNoteRepository : NSObject <NSCoding>
+(HVNoteRepository*)newHVNoteRepository;
-(void)list; //+
-(void)push:(HVNote*)note;//+
-(HVNote*)pop;//+
-(void)reset;
//-(void)save;
-(HVNote*)last;//+
@end
