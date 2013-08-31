//
//  ViewController.h
//  Arquivos
//
//  Created by Leonardo on 31/08/13.
//  Copyright (c) 2013 Leonardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblLabel;
@property (weak, nonatomic) IBOutlet UITextField *txtText;
@property (weak, nonatomic) IBOutlet UIButton *btnButton;
- (IBAction)btnAcao:(id)sender;
- (IBAction)btnLer:(id)sender;
- (IBAction)dragEnter:(id)sender;
- (IBAction)dragExit:(id)sender;

@end
