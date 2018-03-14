//
//  RDPPaymentResultQueryDelegate.h
//  ExampleRDP
//
//  Created by 霍驹 on 2018/3/7.
//  Copyright © 2018年 HJ. All rights reserved.
//

#ifndef RDPPaymentResultQueryDelegate_h
#define RDPPaymentResultQueryDelegate_h
#import "RDPPaymentResultQueryResponse.h"
@protocol RDPPaymentResultQueryDelegate <NSObject>
- (void) onRequestFailedWithErrorCode:(int) errorCode andDescription:(NSString*) description;
- (void) onRequestFinishedWithResponseObject:(RDPPaymentResultQueryResponse*) response;

@end

#endif /* RDPPaymentResultQueryDelegate_h */
