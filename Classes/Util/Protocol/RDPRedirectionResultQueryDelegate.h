//
//  RDPRedirectionResultQueryDelegate.h
//  ExampleRDP
//
//  Created by 霍驹 on 2018/3/6.
//  Copyright © 2018年 HJ. All rights reserved.
//

#ifndef RDPRedirectionResultQueryDelegate_h
#define RDPRedirectionResultQueryDelegate_h
#import "RDPRedirectionResultQueryResponse.h"
@protocol RDPRedirectionResultQueryDelegate <NSObject>
- (void) onRequestFailedWithErrorCode:(int) errorCode andDescription:(NSString*) description;
- (void) onRequestFinishedWithResponseObject:(RDPRedirectionResultQueryResponse*) response;

@end
#endif /* RDPRedirectionResultQueryDelegate_h */
