//
//  VariableStore.m
//  Ass3
//
//  Created by Me on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VariableStore.h"

@implementation VariableStore
+ (VariableStore *)sharedInstance
{
    // the instance of this class is stored here
    static VariableStore *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        myInstance->guesses = 0;
        myInstance->guess_suit = @"Hearts";
        myInstance->guess_number = @"Ace";
        
    }
    // return the instance of this class
    return myInstance;
}
@end
