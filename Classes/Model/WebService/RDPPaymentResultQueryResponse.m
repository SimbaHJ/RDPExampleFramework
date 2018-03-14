//
//  RDPPaymentResultQueryResponse.m
//  ExampleRDP
//
//  Created by 霍驹 on 2018/3/7.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import "RDPPaymentResultQueryResponse.h"

@implementation RDPPaymentResultQueryResponse
- (void) parse :(NSData*)data {
    [super parse:data];
    if(self.response_code.intValue == 0) {
        self.mid = [self.jsonObject objectForKey:@"mid"];
        self.request_mid = [self.jsonObject objectForKey:@"request_mid"];
        self.order_id = [self.jsonObject objectForKey:@"order_id"];
        self.transaction_id = [self.jsonObject objectForKey:@"transaction_id"];
        self.request_amount = [self.jsonObject objectForKey:@"request_amount"];
        self.request_ccy = [self.jsonObject objectForKey:@"request_ccy"];
        self.request_timestamp = [self.jsonObject objectForKey:@"request_timestamp"];
        self.authorized_amount = [self.jsonObject objectForKey:@"authorized_amount"];
        self.authorized_ccy = [self.jsonObject objectForKey:@"authorized_ccy"];
        self.transaction_type = [self.jsonObject objectForKey:@"transaction_type"];
        self.created_timestamp = [self.jsonObject objectForKey:@"created_timestamp"];
        self.acquirer_response_code = [self.jsonObject objectForKey:@"acquirer_response_code"];
        self.acquirer_response_msg = [self.jsonObject objectForKey:@"acquirer_response_msg"];
        self.signature = [self.jsonObject objectForKey:@"signature"];
        self.acquirer_authorized_amount = [self.jsonObject objectForKey:@"acquirer_authorized_amount"];
        self.acquirer_authorized_ccy = [self.jsonObject objectForKey:@"acquirer_authorized_ccy"];
        self.merchant_reference = [self.jsonObject objectForKey:@"merchant_reference"];
        self.acquirer_created_timestamp = [self.jsonObject objectForKey:@"acquirer_created_timestamp"];
        self.acquirer_transaction_id = [self.jsonObject objectForKey:@"acquirer_transaction_id"];
        self.acquirer_authorization_code = [self.jsonObject objectForKey:@"acquirer_authorization_code"];
        self.first_6 = [self.jsonObject objectForKey:@"first_6"];
        self.last_4 = [self.jsonObject objectForKey:@"last_4"];
        self.exp_date = [self.jsonObject objectForKey:@"exp_date"];
        self.payment_mode = [self.jsonObject objectForKey:@"payment_mode"];
        self.payer_id = [self.jsonObject objectForKey:@"payer_id"];
        self.payer_name = [self.jsonObject objectForKey:@"payer_name"];
        self.acquirer_mpi_eci = [self.jsonObject objectForKey:@"acquirer_mpi_eci"];
        self.uatp = [self.jsonObject objectForKey:@"uatp"];
        self.merchant_data1 = [self.jsonObject objectForKey:@"merchant_data1"];
    }
}
@end
