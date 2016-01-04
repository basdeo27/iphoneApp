//
//  SecretaryHome.m
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-03.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import "SecretaryHome.h"
#import "AttendanceObject.h"
#import "anAttendanceRecord.h"



@interface SecretaryHome ()

@end

@implementation SecretaryHome

NSMutableArray *meetingList = nil;
NSInteger theRowNumber  = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Home ViewDidLoad");
    NSInteger meetingListLength = [meetingList count];
    if(meetingListLength == 0){
        NSLog(@"We are initiating meetingList again");
        meetingList = [[NSMutableArray alloc] init];
    }
    NSInteger memberListLength = [memberList count];
    if(memberListLength == 0){
        memberList = [[NSMutableArray alloc] init];
    }
    // Do any additional setup after loading the view, typically from a nib.
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [meetingList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *SimpleIdentifier = @"SimpleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    
    if(cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleIdentifier];
    }
    
    NSInteger index = [meetingList count] - 1 - indexPath.row;
    AttendanceObject *record = [meetingList objectAtIndex:index];
    NSString *date = [[NSDate dateWithTimeIntervalSince1970:record.time] description];
    //Taking only the date yyyy/mm/dd part of the time stamp
    date = [date substringWithRange:NSMakeRange(0,10)];
    cell.textLabel.text = [NSString stringWithFormat:@"Record Date: %@", date];
    
    NSInteger total = record.present + record.missed;
    NSString * subtitle = [NSString stringWithFormat:@"Members Present: %ld/%ld", (long)record.present, (long)total];
    cell.detailTextLabel.text = subtitle;
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    theRowNumber = [meetingList count] - 1 - indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"RecordReview" sender:self];
    
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
