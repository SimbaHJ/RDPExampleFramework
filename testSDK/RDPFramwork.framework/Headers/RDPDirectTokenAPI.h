//
//  RDPDirectTokenAPI.h
//  ExampleRDPSDk
//
//  Created by 霍驹 on 2018/2/24.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPDirectTokenType.h"
#import "RDPHttpPostRequest.h"
#import "RDPDirectTokenAPIDelegate.h"
#define RDP_DITAPI_API_MODE @"direct_token_api"
#define RDP_DITAPI_DEV_URL @"https://secure-dev.reddotpayment.com/service/token-api"
#define RDP_DITAPI_PRODUCTION_URL @"https://secure.reddotpayment.com/service/token-api"

@interface RDPDirectTokenAPI : NSObject
@property(nonatomic, weak) id<RDPDirectTokenAPIDelegate> delegate;
@property(nonatomic, strong)NSString * secret_key;
//Mandatory
@property(nonatomic , strong)NSString *mid;
@property(nonatomic , strong)NSString *order_id;
@property(nonatomic , strong)NSString *api_mode;
//@property(nonatomic , assign) enum RDPDirectTokenType token_type;
@property(nonatomic , strong)NSString *transaction_type;
@property(nonatomic , strong)NSString *payer_email;
@property(nonatomic , strong)NSString *payer_name;
//@property(nonatomic , strong)NSString *signature;

//Conditional
@property(nonatomic , strong)NSString *ccy;
@property(nonatomic , strong)NSString *payer_id;
@property(nonatomic , strong)NSString *card_no;
@property(nonatomic , strong)NSString *exp_date;
@property(nonatomic , strong)NSString *cvv2;
@property(nonatomic , strong)NSString *bill_to_forename;
@property(nonatomic , strong)NSString *bill_to_surname;
@property(nonatomic , strong)NSString *bill_to_address_city;
@property(nonatomic , strong)NSString *bill_to_address_line1;
@property(nonatomic , strong)NSString *bill_to_address_country;
@property(nonatomic , strong)NSString *bill_to_address_state;
@property(nonatomic , strong)NSString *bill_to_address_postal_code;
@property(nonatomic , strong)NSString *bill_to_phone;
@property(nonatomic , strong)NSString *wallet_id;
//@property(nonatomic , strong)NSString *token_id;
//Optional
@property(nonatomic , strong)NSString *merchant_reference;
@property(nonatomic , strong)NSString *bill_to_address_line2;
@property(nonatomic , strong)NSString *notify_url;

- (id) initWithDelegate:(id<RDPDirectTokenAPIDelegate>) delegate;
- (void) startRequest;


@end
