//
//  CreateCSV.h
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-06.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *selectedButton;
extern NSArray *sortedArray;

@interface CreateCSV : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *fileName;
    IBOutlet UIButton *ShareFaceBook;
    IBOutlet UIButton *name;
    IBOutlet UIButton *attendanceRecord;
    IBOutlet UIButton *position;
    
}

- (IBAction)ShareFacebook:(id)sender;

@end
