//
//  RecordReview.h
//  SecretaryPart2
//
//  Created by Dylan Basdeo on 2015-09-05.
//  Copyright (c) 2015 Dylan Basdeo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSInteger memberNumber;
extern NSInteger editing;

@interface RecordReview : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    IBOutlet UITableView *theTableView;
    IBOutlet UIButton *goBack;
    IBOutlet UIButton *deleteRecord;
    
}

-(IBAction)edit:(id)sender;


@end
