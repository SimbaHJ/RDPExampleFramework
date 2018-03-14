//
//  RDPRedirectionResultQueryResponse.m
//  ExampleRDP
//
//  Created by 霍驹 on 2018/3/6.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import "RDPRedirectionResultQueryResponse.h"

@implementation RDPRedirectionResultQueryResponse
- (void) parse :(NSData*)data {
    [super parse:data];
    if(self.response_code.intValue == 0) {
        self.mid = [self.jsonObject objectForKey:@"mid"];
        self.signature = [self.jsonObject objectForKey:@"signature"];
        self.created_timestamp = [self.jsonObject objectForKey:@"created_timestamp"];
        self.acquirer_response_code = [self.jsonObject objectForKey:@"acquirer_response_code"];
        self.order_id = [self.jsonObject objectForKey:@"order_id"];
        self.transaction_id = [self.jsonObject objectForKey:@"transaction_id"];
        self.acquirer_response_msg = [self.jsonObject objectForKey:@"acquirer_response_msg"];
        self.merchant_reference = [self.jsonObject objectForKey:@"merchant_reference"];
        self.first_6 = [self.jsonObject objectForKey:@"first_6"];
        self.last_4 = [self.jsonObject objectForKey:@"last_4"];
        self.exp_date = [self.jsonObject objectForKey:@"exp_date"];
        self.payer_id = [self.jsonObject objectForKey:@"payer_id"];
        self.payer_name = [self.jsonObject objectForKey:@"payer_name"];
        self.payer_email = [self.jsonObject objectForKey:@"payer_email"];
        self.transaction_type = [self.jsonObject objectForKey:@"transaction_type"];
        self.token_id = [self.jsonObject objectForKey:@"token_id"];
    }
}
@end
