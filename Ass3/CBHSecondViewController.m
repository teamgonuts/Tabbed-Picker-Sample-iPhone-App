//
//  CBHSecondViewController.m
//  Ass3
//
//  Created by Me on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBHSecondViewController.h"
#import "VariableStore.h"
#import <AudioToolbox/AudioToolbox.h>


@implementation CBHSecondViewController
@synthesize lblGuessText;
@synthesize lblGuess;
@synthesize lblResult;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Check", @"Check");
        self.tabBarItem.image = [UIImage imageNamed:@"check"];
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
}

- (void)viewDidUnload
{
    [self setLblGuess:nil];
    [self setLblResult:nil];
    [self setLblGuessText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    VariableStore *temp = [VariableStore sharedInstance];
    temp->guesses = temp->guesses + 1;
    lblGuess.text = [NSString stringWithFormat:@"Guess #%d",
                     temp->guesses];
    lblGuessText.text = [NSString stringWithFormat:@"The %@ of %@", 
                         temp->guess_number, temp->guess_suit];
    
    //check if answer is correct
    NSLog([NSString stringWithFormat:@"Answer|| Suit:%@, Card:%@", temp->suit, temp->number]);
    NSLog([NSString stringWithFormat:@"Guess|| Suit:%@, Card:%@", temp->guess_suit, temp->guess_number]);
    if ([temp->suit isEqualToString:temp->guess_suit] && [temp->number  isEqualToString:temp->guess_number]){
        lblResult.text = @"CORRECT";
        lblResult.textColor = [UIColor greenColor];
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win"
                                                  withExtension:@"mp3"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
        AudioServicesPlaySystemSound(soundID);
    }
    else{
        lblResult.text = @"INCORRECT";
        lblResult.textColor = [UIColor redColor];
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"no"
                                                  withExtension:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
        AudioServicesPlaySystemSound(soundID);
    }
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

@end
