//
//  MUBooleanCellData.m
//  MUKitTest
//
//  Created by Yuriy Bosov on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MUCellDataSwitch.h"
#import "MUCellSwitch.h"

@implementation MUCellDataSwitch

@synthesize boolValue;
@synthesize targetAction;
@synthesize onText;
@synthesize offText;

#pragma mark - Init/Dealloc

- (id) initWithObject:(NSObject *)aObject key:(NSString *)aKey
{
    self = [super initWithObject:aObject key:aKey];
    if(self)
    {
        self.cellClass = [MUCellSwitch class];
        self.cellSelectionStyle = UITableViewCellSelectionStyleNone;
        targetAction = [[MUTargetAction alloc] init];
    }
    return self;
}


- (void) dealloc
{
    [targetAction release];
    [onText release];
    [offText release];
    
    [super dealloc];
}

#pragma mark - Target/Action

- (void) setTarget:(id)aTarget action:(SEL)anAction
{
    [targetAction setTarget:aTarget action:anAction];
}

#pragma mark - Maping

- (void) mapFromObject
{
    if (object && key)
        boolValue = [[object valueForKeyPath:key] boolValue];
}


- (void) mapToObject
{
    if (object && key)
        [object setValue:[NSNumber numberWithBool:boolValue] forKeyPath:key];
}

@end
