//
//  DeviceID.m
//  EverInput
//
//  Created by Lines  on 14/7/28.
//  Copyright (c) 2014年 AISpeech. All rights reserved.
//

#import "DeviceID.h"
#import <UIKit/UIKit.h>
#import <Security/Security.h>
//#import "SynthesizeSingleton.h"
#import "SSKeychain.h"
#define SYNTHESIZE_SINGLETON_ARC(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)sharedInstance \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
}
NSString * const kKCServiceName = @"group.AiIME";
NSString * const kUDIDName = @"UDID";

@interface DeviceID ()

@property (nonatomic, strong) NSString *uniqueID;

@end

@implementation DeviceID

SYNTHESIZE_SINGLETON_ARC(DeviceID);

- (id)init {
    self = [super init];
    if (self) {
        self.uniqueID = [SSKeychain passwordForService:kKCServiceName account:kUDIDName];
        if (0 == self.uniqueID.length) {
            self.uniqueID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            self.uniqueID = [self.uniqueID stringByReplacingOccurrencesOfString:@"-" withString:@""];
            [SSKeychain setPassword:self.uniqueID forService:kKCServiceName account:kUDIDName];
        }
    }
    return self;
}

+ (NSString *)deviceID {
    return [[self sharedInstance] uniqueID];
}

@end
