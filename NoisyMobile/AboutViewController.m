//
//  AboutViewController.m
//  NoisyMobile
//
//  Created by Joe Hoper on 15/01/2019.
//

#import "AboutViewController.h"
#import "../Source/NoiseGenerator.h"

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)viewOnGitHubTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:GITHUB_URL] options:@{} completionHandler:nil];
}

- (IBAction)viewOnWikipediaTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:WIKIPEDIA_URL] options:@{} completionHandler:nil];
}

- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
