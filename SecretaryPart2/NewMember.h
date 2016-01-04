//
//  NewMember.h
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-05.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSMutableArray *years;
//extern NSMutableArray *memberList2;

@interface NewMember : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
    IBOutlet UITextField *memberName;
    IBOutlet UITextField *memberPosition;
    IBOutlet UITextField *memberClass;
    IBOutlet UIPickerView *pickerView;
    
    IBOutlet UIButton *goBack;
    IBOutlet UIButton *classButton;
    
    
}
//@property (copy, nonatomic) NSMutableArray *aMemberList;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (IBAction)goBack:(id)sender;
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender;
- (void)showAlert;
- (IBAction)classButton:(id)sender;

@end
