//
//  MemberProfile.m
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-06.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import "MemberProfile.h"
#import "anAttendanceRecord.h"
#import "SecretaryHome.h"
#import "RecordReview.h"
#import "Member.h"
#import "AttendanceObject.h"

@interface MemberProfile ()

@end

@implementation MemberProfile

Member *theMember;

- (void)viewDidLoad {
    [super viewDidLoad];
    theMember = [memberList objectAtIndex:memberNumber];
    memberName.text = theMember.name;
    memberPosition.text = theMember.position;
    attendanceRecord.text = [NSString stringWithFormat:@"Attendance Record: %ld/%ld", (long)theMember.present, (long)theMember.total];
    timesLate.text = [NSString stringWithFormat:@"Times Late: %ld", (long)theMember.late];
    timesExcused.text = [NSString stringWithFormat:@"Times Excused: %ld", (long)theMember.excused];
    
    // Hide the additional layer
    self->theName.delegate = self;
    self->thePosition.delegate = self;
    outline.hidden = NO;
    [self flipExtraLayer];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)editMember:(id)sender{
    outline.layer.cornerRadius = 5;
    outline.layer.borderWidth = 1;
    outline.layer.borderColor = [[UIColor blackColor] CGColor];
    [self flipExtraLayer];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //Makes the keyboard to dissapear
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)cancel:(id)sender{
    [self flipExtraLayer];
}

-(IBAction)saveMember:(id)sender {
    theMember.name = theName.text;
    if(memberPosition.text.length == 0){
        theMember.position = @"NONE";
    }
    else{
        theMember.position = thePosition.text;
    }
    [self flipExtraLayer];
    
    memberName.text = theMember.name;
    memberPosition.text = theMember.position;
}

-(IBAction)deleteMember:(id)sender {
    [self checkDeleteAlert];
}

- (void)checkDeleteAlert {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Warning"
                                                   message: @"This action cannot be undone"
                                                  delegate: self
                                         cancelButtonTitle: nil
                                         otherButtonTitles:@"Ok", @"Cancel", nil];
    
    alert.tag = 100;
    [alert show];
    
}


-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    // Is this my Alert View?
    if (alertView.tag == 100) {
        //Yes
        
        
        // You need to compare 'buttonIndex' & 0 to other value(1,2,3) if u have more buttons.
        // Then u can check which button was pressed.
        if (buttonIndex == 0) {// 1st Other Button
            
            // Goes through each meeting and removes this members statistics from that meeting
            for (int i = 0; i < [meetingList count]; i++){
                
                AttendanceObject *record = [meetingList objectAtIndex:i];
                NSString *epochTime = [NSString stringWithFormat:@"%f", record.time];
                NSString *wasThere = [theMember.presentTable valueForKey:epochTime];

                if(wasThere != NULL){
                    if([wasThere isEqualToString:@"YES"] || [wasThere isEqualToString:@"LATE"]){
                        record.present -= 1;
                    }
                    else {
                        record.missed -= 1;
                    }
                    
                }
            }
            
            [memberList removeObjectAtIndex:memberNumber];
            [self performSegueWithIdentifier:@"deleteMember" sender:self];
        }
        else if (buttonIndex == 1) {// 2nd Other Button

            
        }
        
    }
    else {
        //No
        // Other Alert View
        
    }
    
}


-(void)flipExtraLayer {
    if(outline.hidden == YES){
        outline.hidden = NO;
        newMemberName.hidden = NO;
        newMemberPosition.hidden = NO;
        theName.hidden = NO;
        thePosition.hidden = NO;
        cancel.hidden = NO;
        save.hidden = NO;
    }
    else{
        outline.hidden = YES;
        newMemberName.hidden = YES;
        newMemberPosition.hidden = YES;
        theName.hidden = YES;
        thePosition.hidden = YES;
        cancel.hidden = YES;
        save.hidden =YES;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
