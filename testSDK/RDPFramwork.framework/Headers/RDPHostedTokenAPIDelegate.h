//
//  RDPHostedTokenAPIDelegate.h
//  ExampleRDPSDk
//
//  Created by 霍驹 on 2018/2/26.
//  Copyright © 2018年 HJ. All rights reserved.
//

#ifndef RDPHostedTokenAPIDelegate_h
#define RDPHostedTokenAPIDelegate_h
#import "RDPHostTokenAPIResponse.h"
@protocol RDPHostedTokenAPIDelegate <NSObject>

- (void) onRequestFailedWithErrorCode:(int) errorCode andDescription:(NSString*) description;
- (void) onRequestFinishedWithResponseObject:(RDPHostTokenAPIResponse*) response;

@optional


@end

#endif /* RDPHostedTokenAPIDelegate_h */
