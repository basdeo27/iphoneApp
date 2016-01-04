//
//  MemberProfile.h
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-06.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberProfile : UIViewController <UITextFieldDelegate> {
    IBOutlet UILabel *memberName;
    IBOutlet UILabel *memberPosition;
    IBOutlet UILabel *attendanceRecord;
    IBOutlet UILabel *timesLate;
    IBOutlet UILabel *timesExcused;
    IBOutlet UIButton *edit;
    IBOutlet UIButton *deleteMember;
    
    //New Layer to edit member properties
    IBOutlet UILabel *outline;
    IBOutlet UILabel *newMemberName;
    IBOutlet UILabel *newMemberPosition;
    IBOutlet UITextField *theName;
    IBOutlet UITextField *thePosition;
    IBOutlet UIButton *cancel;
    IBOutlet UIButton *save;
}

@end
