//
//  VariableStore.h
//  Ass3
//
//  Created by Me on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VariableStore : NSObject
{
@public
    int guesses;
    NSString *suit;
    NSString *number;
    NSString *guess_suit;
    NSString *guess_number;
    
}

// message from which our instance is obtained
+ (VariableStore *)sharedInstance;
@end

