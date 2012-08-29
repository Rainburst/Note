//
//  HVNote.h
//  note
//
//  Created by Nikita Ilyasov on 29.08.12.
//  Copyright (c) 2012 Hex Violet. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString * const kURLType = @"kURL";
static NSString * const kTextType = @"kTextType";

@interface HVNote : NSObject <NSCoding>
@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) NSDate* date;
-(void) open;
-(id)initWithText:(NSString*)text;
@end
