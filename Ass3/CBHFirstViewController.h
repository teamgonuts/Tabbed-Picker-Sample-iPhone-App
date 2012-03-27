//
//  CBHFirstViewController.h
//  Ass3
//
//  Created by Me on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define _cardNumberComponent 0
#define _cardSuitComponent 1

@interface CBHFirstViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *cardNumber;
@property (strong, nonatomic) NSArray *cardSuit;

@end
