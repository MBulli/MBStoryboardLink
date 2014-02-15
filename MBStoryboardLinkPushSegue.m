//
//  MBStoryboardLinkPushSegue.m
//  MBStoryboardLink
//
//  Created by Markus on 29.11.13.
//  Copyright (c) 2013 Markus. All rights reserved.
//

#import "MBStoryboardLinkPushSegue.h"

@implementation MBStoryboardLinkPushSegue

-(void)perform
{
    UIViewController *src = (UIViewController*)self.sourceViewController;
    UIViewController *dst = (UIViewController*)self.destinationViewController;
    
    [src.navigationController pushViewController:dst animated:self.animated];
}
@end