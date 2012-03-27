//
//  CBHFirstViewController.m
//  Ass3
//
//  Created by Me on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBHFirstViewController.h"
#include <stdlib.h>
#import "VariableStore.h"

@implementation CBHFirstViewController
@synthesize picker;
@synthesize cardSuit;
@synthesize cardNumber;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Guess", @"Guess");
        self.tabBarItem.image = [UIImage imageNamed:@"guess"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //Filling Card_Number picker
    NSArray *cardNumberArray = [[NSArray alloc] initWithObjects:@"Ace",
                            @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                            @"Jack", @"Queen", @"King", nil];
    self.cardNumber = cardNumberArray;
    /*
    UIImage *diamond = [UIImage imageNamed:@"diamond.png"];
    UIImage *club = [UIImage imageNamed:@"club.png"];
    UIImage *spade = [UIImage imageNamed:@"spade.png"];
    UIImage *heart = [UIImage imageNamed:@"heart.png"];
    
    UIImageView *diamondView = [[UIImageView alloc] initWithImage:diamond];
    UIImageView *clubView = [[UIImageView alloc] initWithImage:club];
    UIImageView *spadeView = [[UIImageView alloc] initWithImage:spade];
    UIImageView *heartView = [[UIImageView alloc] initWithImage:heart];
    NSArray *imageViewArray = [[NSArray alloc] initWithObjects: 
                               diamondView, clubView, spadeView, heartView, nil];
    self.cardSuit = imageViewArray;
    */
    NSArray *cardSuitArray = [[NSArray alloc] initWithObjects:
                              @"Hearts", @"Diamonds",
                              @"Spades", @"Clubs", nil];
    self.cardSuit = cardSuitArray;
    
    //generating answer
    srandom(time(NULL));
    int answerNumber = arc4random() % 13;
    srandom(time(NULL));
    int answerSuit = arc4random() % 4;
    VariableStore *gVars = [VariableStore sharedInstance];
    gVars->suit = [self.cardSuit objectAtIndex:answerSuit];
    gVars->number = [self.cardNumber objectAtIndex:answerNumber];
    NSLog([NSString stringWithFormat:@"Answer|| Suit:% @, Card: %@", gVars->suit, gVars->number]);


}

- (void)viewDidUnload
{
    [self setPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.picker = nil;
    self.cardSuit = nil;
    self.cardNumber = nil;
    
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    if(component == _cardNumberComponent){
        return [self.cardNumber count];
    }
    
    //else
    return [self.cardSuit count];
}

#pragma mark Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    
    VariableStore *temp = [VariableStore sharedInstance];
    if (component == _cardNumberComponent){
        return [self.cardNumber objectAtIndex:row];
    }
    else{
        return [self.cardSuit objectAtIndex:row];
    }
}

- (void) pickerView:(UIPickerView *)pickerView 
       didSelectRow:(NSInteger)row 
        inComponent:(NSInteger)component{
    VariableStore *temp = [VariableStore sharedInstance];
    if (component == _cardNumberComponent){
        temp->guess_number = [self.cardNumber objectAtIndex:row];
    }
    else{
        temp->guess_suit = [self.cardSuit objectAtIndex:row];
    }
    
}
/*
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view {
    if (component == _cardSuitComponent){
        NSLog(@"Card Suit Component");
        return [self.cardSuit objectAtIndex:row];
    }
    else{
        NSLog(@"Card Number Component");
        return [self.cardNumber objectAtIndex:row];
    }
}
 */



@end
