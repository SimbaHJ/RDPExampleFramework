//
//  RDPHostedTokenAPI.h
//  ExampleRDPSDk
//
//  Created by 霍驹 on 2018/2/26.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RDPHostedTokenAPIDelegate.h"
#import "RedirectAPIInternalDelegate.h"
#define RDP_HOTAPI_API_MODE @"hosted_token_api"
#define RDP_HOTAPI_DEV_URL @"https://secure-dev.reddotpayment.com/service/token-api"
#define RDP_HOTAPI_PRODUCTION_URL @"https://secure.reddotpayment.com/service/token-api"

@interface RDPHostedTokenAPI : NSObject
@property(nonatomic, weak) id<RDPHostedTokenAPIDelegate> delegate;
@property(nonatomic, weak) id<RedirectAPIInternalDelegate> internalDelegate;
@property(nonatomic, strong)NSString * secret_key;
//Mandatory
@property(nonatomic , strong)NSString *mid;
@property(nonatomic , strong)NSString *order_id;
//@property(nonatomic , strong)NSString *api_mode;
//@property(nonatomic , strong)NSString *transaction_type;
@property(nonatomic , strong)NSString *transaction_type;
@property(nonatomic , strong)NSString *payer_email;
@property(nonatomic , strong)NSString *payer_name;
@property(nonatomic , strong)NSString *back_url;
@property(nonatomic , strong)NSString *redirect_url;
@property(nonatomic , strong)NSString *notify_url;
//@property(nonatomic , strong)NSString *signature;


//Conditional
@property(nonatomic , strong)NSString *payer_id;
@property(nonatomic , strong)NSString *ccy;
@property(nonatomic , strong)NSString *bill_to_forename;
@property(nonatomic , strong)NSString *bill_to_surname;
@property(nonatomic , strong)NSString *bill_to_address_city;
@property(nonatomic , strong)NSString *bill_to_address_line1;
@property(nonatomic , strong)NSString *bill_to_address_country;
@property(nonatomic , strong)NSString *bill_to_address_state;
@property(nonatomic , strong)NSString *bill_to_address_postal_code;
@property(nonatomic , strong)NSString *bill_to_phone;
//Optional
@property(nonatomic , strong)NSString *merchant_reference;
@property(nonatomic , strong)NSString *bill_to_address_line2;


- (id) initWithDelegate:(id<RDPHostedTokenAPIDelegate>) delegate;
- (void) startRequest;
@end
