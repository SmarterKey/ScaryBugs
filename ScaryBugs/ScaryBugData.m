//
//  ScaryBugData.m
//  ScaryBugs
//
//  Created by Administrator on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

@synthesize title = _title;
@synthesize rating = _rating;

-(id)initWithTitle:(NSString *)title rating:(float)rating {
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}


@end
