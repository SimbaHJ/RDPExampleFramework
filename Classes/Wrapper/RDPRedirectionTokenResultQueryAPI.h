//
//  RedirectionResultQueryAPI.h
//  ExampleRDP
//
//  Created by 霍驹 on 2018/3/6.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPRedirectionResultQueryDelegate.h"


#define RDP_RAPI_QUERY_DEV_URL @"http://secure-dev.reddotpayment.com/service/Merchant_processor/query_token_redirection"
#define RDP_RAPI_QUERY_PRODUCTION_URL @"https://secure.reddotpayment.com/service/Merchant_processor/query_token_redirection"

@interface RDPRedirectionTokenResultQueryAPI : NSObject
@property(nonatomic, strong) NSString* request_mid;
@property(nonatomic, strong) NSString* transaction_id;
@property(nonatomic, strong) NSString* secret_key;
@property(nonatomic, weak) id <RDPRedirectionResultQueryDelegate> delegate;
- (id) initWithDelegate:(id<RDPRedirectionResultQueryDelegate>) delegate;
- (void) startRequest;
@end
