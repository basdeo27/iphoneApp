//
//  anAttendanceRecord.h
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-04.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSTimeInterval nsIntervalTime;
extern NSString *epochTime;
extern NSMutableArray *memberList;

@interface anAttendanceRecord : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *theTable;
    IBOutlet UIButton *saveAttendanceRecord;
    IBOutlet UIButton *addMembers;
    NSMutableArray *theArray;
}

-(IBAction)saveAttendanceRecord:(id)sender;

@end
