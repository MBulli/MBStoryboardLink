//
//  MBStoryboardLinkViewController.h
//  MBStoryboardLink
//
//  Created by Markus on 29.11.13.
//  Copyright (c) 2013 Markus. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBStoryboardLinkSegue.h"
#import "MBStoryboardLinkPushSegue.h"
#import "MBStoryboardLinkModalSegue.h"

@interface MBStoryboardLink : UIViewController

/// The name of the storyboard that should be linked.
/// This should be set in the Interface Builder identity inspector.
@property (nonatomic, copy) NSString * storyboardName;

/// (Optional) The identifier of the scene to show.
/// This should be set in the Interface Builder identity inspector.
@property (nonatomic, copy) NSString * sceneIdentifier;
@end
