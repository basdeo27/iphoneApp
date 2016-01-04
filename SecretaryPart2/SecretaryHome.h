//
//  SecretaryHome.h
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-03.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import <UIKit/UIKit.h>


extern NSMutableArray *meetingList;
extern NSInteger theRowNumber;

@interface SecretaryHome : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    IBOutlet UITableView *tableOfMembers;
}


@end
