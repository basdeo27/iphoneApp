//
//  NewMember.m
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-05.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import "NewMember.h"
#import "Member.h"
#import "anAttendanceRecord.h"

@interface NewMember ()

@end

@implementation NewMember

NSMutableArray *years = nil;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Allows the keyboard to dissapear
    self->memberName.delegate = self;
    self->memberPosition.delegate = self;
    self->memberClass.delegate = self;
    self->pickerView.delegate = self;
    self->pickerView.dataSource = self;
    pickerView.hidden = YES;
    
    
    classButton.layer.cornerRadius = 5;
    classButton.layer.borderWidth = 1;
    classButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    // Loads the UIPicker
    //Get Current Year into i2
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    int i2  = [[formatter stringFromDate:[NSDate date]] intValue];
    
    
    //Create Years Array from 2008 to This year
    years = [[NSMutableArray alloc] init];
    for (int i=2008; i<=i2; i++) {
        [years addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(IBAction)goBack:(id)sender{
    
    // Creating the new member
    Member *aMember= [Member new];
    aMember.name = memberName.text;
    // Make sure a name is present
    if(aMember.name.length < 1 || [classButton.currentTitle isEqualToString:@"Click to Select Year"]){
        [self showAlert];
    }
    else{
        if(memberPosition.text.length == 0){
            aMember.position = @"NONE";
        }
        else{
            aMember.position = memberPosition.text;
        }
        
        aMember.year = classButton.currentTitle;
        aMember.present = 0;
        aMember.total = 0;
        aMember.current = 0;
        aMember.late = 0;
        aMember.excused = 0;
        aMember.presentTable = [[NSMutableDictionary alloc] init];
        
        //NSLog(@"Member name: %@", aMember.name);
        
        // Adding the new member to the list
        //NSValue * mem = [NSValue value:&aMember withObjCType:@encode(Member)];
        [memberList addObject:aMember];
        [self performSegueWithIdentifier:@"back" sender:self];
    }
    
}

- (void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Warning"
                                                   message: @"Name and Class required. Member will not be added."
                                                  delegate: self
                                         cancelButtonTitle: nil
                                         otherButtonTitles:@"Ok", @"Cancel", nil];
    
    
    alert.tag = 100;
    [alert show];
    
}


-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    // Is this my Alert View?
    if (alertView.tag == 100) {

        if (buttonIndex == 0) {// 1st Other Button
            // Cancel adding the member
            [self performSegueWithIdentifier:@"back" sender:self];
        }
        else if (buttonIndex == 1) {// 2nd Other Button
            // Stay on add member
        }
        
    }
    else {
        //No
        // Other Alert View
        
    }
    
}

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    if ([identifier isEqualToString:@"back"]) {
//        if(memberName.text.length <1 || [classButton.currentTitle isEqualToString:@"Click to Select Year"]){
//            return NO;
//        }
//    }
//    return YES;
//}

- (IBAction)classButton:(id)sender {
    pickerView.hidden = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //Makes the keyboard to dissapear
    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView*)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [years count];
    
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [years objectAtIndex:row];
    
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *year = [years objectAtIndex:row];
    [classButton setTitle: year forState: UIControlStateNormal];
    pickerView.hidden = YES;
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
