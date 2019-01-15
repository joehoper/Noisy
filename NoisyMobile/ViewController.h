//
//  ViewController.h
//  NoisyMobile
//
//  Created by Joe Hoper on 14/01/2019.
//

#import <UIKit/UIKit.h>

#define PLAY_IN_BACKGROUND_KEY @"PLAY_IN_BACKGROUND"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *playInBackgroundSwitch;
- (IBAction)playInBackgroundSwitchChanged:(id)sender;
@end
