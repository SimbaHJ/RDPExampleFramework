//
//  RDPDirectTokenAPIDelegate.h
//  ExampleRDPSDk
//
//  Created by 霍驹 on 2018/2/24.
//  Copyright © 2018年 HJ. All rights reserved.
//

#ifndef RDPDirectTokenAPIDelegate_h
#define RDPDirectTokenAPIDelegate_h
#import "RDPDirectTokenAPIResponse.h"
@protocol RDPDirectTokenAPIDelegate <NSObject>

- (void) onRequestFailedWithErrorCode:(int) errorCode andDescription:(NSString*) description;
- (void) onRequestFinishedWithResponseObject:(RDPDirectTokenAPIResponse*) response;

@optional


@end


#endif /* RDPDirectTokenAPIDelegate_h */
