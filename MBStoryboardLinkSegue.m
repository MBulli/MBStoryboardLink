//
//  MBStoryboardLinkSegue.m
//  MBStoryboardLink
//
//  Created by Markus on 26.11.13.
//  Copyright (c) 2013 Markus. All rights reserved.
//

#import "MBStoryboardLinkSegue.h"

#import "MBStoryboardLink.h"

@interface MBStoryboardLinkSegue ()

@end

@implementation MBStoryboardLinkSegue

-(id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    NSAssert([destination isKindOfClass:[MBStoryboardLink class]], @"MBStoryboardLinkSegue can only be used with a MBStoryboardLink as seque destination.");
    
    // get user defined runtime attributes
    NSString *sbName = [(MBStoryboardLink*)destination storyboardName];
    NSString *sceneName = [(MBStoryboardLink*)destination sceneIdentifier];
    
    // if failed try to read the contents of a UILabel
    if ([sbName length] == 0) {
        for (UIView *subView in destination.view.subviews) {
            if ([subView isKindOfClass:[UILabel class]]) {
                NSString *text = [(UILabel*)subView text];
                NSArray *parts = [text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                
                if ([parts count] >= 2) {
                    sbName = parts[0];
                    sceneName = parts[1];
                }
                
                break;
            }
        }
    }
    
    NSAssert(sbName, @"Unable to load linked storyboard. MBStoryboardLink storyboardName is nil. Forgot to set attribute in interface builder?");
    NSAssert(sceneName, @"Unable to load linked scene. MBStoryboardLink sceneIdentifier is nil. Forgot to set attribute in interface builder?");
    
    // load new destination from storyboard
    @try {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
        
        if ([sceneName length] == 0) {
            destination = [sb instantiateInitialViewController];
        } else {
            destination = [sb instantiateViewControllerWithIdentifier:sceneName];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Failed to follow Storyboardlink('%@') to [%@; %@] from %@", identifier, sbName, sceneName, source);
        @throw;
    }
    
    
    
    // continue init with linked destination viewcontroller
    self = [super initWithIdentifier:identifier source:source destination:destination];
    if (self) {
        _animated = YES;
    }
    return self;
}


@end



