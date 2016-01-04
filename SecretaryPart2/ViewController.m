//
//  ViewController.m
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-08-28.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    secretaryButton.layer.cornerRadius = 5;
    secretaryButton.layer.borderWidth = 1;
    secretaryButton.layer.borderColor = [[UIColor blackColor] CGColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
