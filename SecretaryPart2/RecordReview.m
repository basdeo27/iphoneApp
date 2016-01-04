//
//  RecordReview.m
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-05.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import "RecordReview.h"
#import "anAttendanceRecord.h"
#import "Member.h"
#import "AttendanceObject.h"
#import "SecretaryHome.h"


@interface RecordReview ()

@end

@implementation RecordReview

NSInteger memberNumber = 0;
NSInteger editing = 0;
AttendanceObject *record;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    record = [meetingList objectAtIndex:theRowNumber];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return record.present + record.missed;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *SimpleIdentifier = @"NewIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier]; //forIndexPath:indexPath
    
    if(cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleIdentifier];
    }
    
    Member *aMember = [memberList objectAtIndex:indexPath.row];
    cell.textLabel.text = aMember.name;
    
    NSString * subtitle = [NSString stringWithFormat:@"%@ - %@", aMember.position, aMember.year];
    cell.detailTextLabel.text = subtitle;
    
    // Check to see if there should be a checkmark there
    NSString *epochTime = [NSString stringWithFormat:@"%f", record.time];
    NSString *wasThere = [aMember.presentTable valueForKey:epochTime];
    NSLog(@"was There %@", wasThere);
    if([wasThere isEqualToString:@"YES"]){
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        imgView.image = [UIImage imageNamed:@"Check_mark.png"];
        cell.accessoryView = imgView;
    }
    else if([wasThere isEqualToString:@"LATE"]){
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        imgView.image = [UIImage imageNamed:@"before-too-late.png"];
        cell.accessoryView = imgView;
    }
    else if([wasThere isEqualToString:@"EXCUSED"]){
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        imgView.image = [UIImage imageNamed:@"sick.png"];
        cell.accessoryView = imgView;
    }
    else{
        cell.accessoryView = NULL;
    }
    
    return cell;
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    memberNumber = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"NewIdentifier" sender:self];
    
}



-(IBAction)edit:(id)sender{
    // Setting editing to true
    editing = 1;
}

-(IBAction)deleteRecord:(id)sender{
    // Show alert asking if they are sure they want to delete
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
            // Update every member after for the deletion of this attendance object and then delete them
            for (int i = 0; i < [memberList count]; i++){
                Member *aMember = [memberList objectAtIndex:i];
            
            NSString *epochTime = [NSString stringWithFormat:@"%f", record.time];
            NSString *wasThere = [aMember.presentTable valueForKey:epochTime];
            if([wasThere isEqualToString:@"YES"]){
                aMember.present -= 1;
            }
            else if([wasThere isEqualToString:@"LATE"]){
                aMember.present -= 1;
                aMember.late -= 1;
            }
            else if([wasThere isEqualToString:@"EXCUSED"]){
                aMember.excused -= 1;
                aMember.total += 1;
            }
                aMember.total -= 1;
            }
            [meetingList removeObjectAtIndex:theRowNumber];
            [self performSegueWithIdentifier:@"deleteRecord" sender:self];
        }
        else if (buttonIndex == 1) {// 2nd Other Button
            
        }
        
    }
    else {
        //No
        // Other Alert View
        
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
