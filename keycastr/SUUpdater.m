//
//  SUUpdater.m
//  KeyCastr
//
//  Created by zhenyu on 2024/3/20.
//

#import "SUUpdater.h"

@implementation SUUpdater
- (IBAction)checkForUpdates:(id)__unused sender
{

}

- (BOOL)automaticallyChecksForUpdates
{
    return NO;
}

- (NSDate *)lastUpdateCheckDate
{
    return [NSDate date];
}

- (BOOL)sendsSystemProfile
{
    return YES;
}


@end
