//
//  ViewController.m
//  NoisyMobile
//
//  Created by Joe Hoper on 14/01/2019.
//

#import "ViewController.h"
#import "../Source/NoiseGenerator.h"
#import <AVFoundation/AVFoundation.h>

@implementation ViewController {
    NoiseGenerator *generator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:PLAY_IN_BACKGROUND_KEY] != nil) {
        BOOL playInBackground = [[NSUserDefaults standardUserDefaults] boolForKey:PLAY_IN_BACKGROUND_KEY];
        [self setPlaybackMode:playInBackground];
        [self.playInBackgroundSwitch setOn:playInBackground];
    }
    
    generator = [[NoiseGenerator alloc] init];
}

- (IBAction)noiseTypeChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [generator setType:NoNoiseType];
            break;
        case 1:
            [generator setType:WhiteNoiseType];
            break;
        case 2:
            [generator setType:PinkNoiseType];
            break;
        case 3:
            [generator setType:BrownNoiseType];
            break;
    }
}

- (IBAction)volumeSliderChanged:(UISlider *)sender {
    [generator setVolume:sender.value];
}

- (void)setPlaybackMode:(BOOL)playInBackground {
    AVAudioSessionCategory sessionCategory = playInBackground
        ? AVAudioSessionCategoryPlayback
        : AVAudioSessionCategorySoloAmbient;
    
    NSError *error;
    [[AVAudioSession sharedInstance] setCategory:sessionCategory error:&error];
    if (error) {
        NSLog(@"Error setting audio session category: %@", error);
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setBool:playInBackground forKey:PLAY_IN_BACKGROUND_KEY];
}

- (IBAction)playInBackgroundSwitchChanged:(id)sender {
    [self setPlaybackMode:self.playInBackgroundSwitch.on];
}

@end
