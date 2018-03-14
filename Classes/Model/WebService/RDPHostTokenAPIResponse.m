//
//  RDPHostTokenAPIResponse.m
//  ExampleRDPSDk
//
//  Created by 霍驹 on 2018/2/27.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import "RDPHostTokenAPIResponse.h"

@implementation RDPHostTokenAPIResponse
- (void) parse :(NSData*)data {
    [super parse:data];
    if(self.response_code.intValue == 0) {
        self.mid = [self.jsonObject objectForKey:@"mid"];
        self.order_id = [self.jsonObject objectForKey:@"order_id"];
        self.expired_timestamp = [self.jsonObject objectForKey:@"expired_timestamp"];
        self.signature = [self.jsonObject objectForKey:@"signature"];
        self.created_timestamp = [self.jsonObject objectForKey:@"created_timestamp"];
        self.payment_url = [self.jsonObject objectForKey:@"payment_url"];
    }
}
@end
