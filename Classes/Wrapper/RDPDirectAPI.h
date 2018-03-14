//
//  RDPDirectAPI.h
//  RDPSDK
//
//  Created by Ricky Putra Harlim on 5/17/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "DirectAPIPaymentType.h"
#import "DirectAPIDelegate.h"
#import "RDPHttpPostRequest.h"
#import "RDPQueryStringBuilder.h"
#import "RDPSignatureUtil.h"
#import "RDPDirectAPIResponse.h"
#import "RDPUtil.h"
#define RDP_DAPI_API_MODE @"direct_n3d"
#define RDP_DAPI_DEV_URL @"https://secure-dev.reddotpayment.com/service/payment-api"
#define RDP_DAPI_PRODUCTION_URL @"https://secure.reddotpayment.com/service/payment-api"
@interface RDPDirectAPI : NSObject

@property(nonatomic, strong) NSString* mid;
@property(nonatomic, strong) NSString* order_id;
@property(nonatomic, strong) NSString* ccy;
//@property(nonatomic) enum DirectAPIPaymentType payment_type;
@property (nonatomic , strong) NSString * payment_type;
@property(nonatomic) float amount;
@property(nonatomic, strong) NSString* payer_email;
@property(nonatomic, strong) NSString* card_no;
@property(nonatomic, strong) NSString* exp_date;
@property(nonatomic, strong) NSString* payer_name;
@property(nonatomic, strong) NSString* payer_id;
@property(nonatomic, strong) NSString* cvv2;
@property(nonatomic, strong) NSString* token_id;
@property(nonatomic, strong) NSString* token_mod;
@property(nonatomic, weak) id<DirectAPIDelegate> delegate;
@property(nonatomic, strong) NSString* merchant_reference;
@property(nonatomic, strong) NSString* client_user_agent;
@property(nonatomic, strong) NSString* client_ip_address;
@property(nonatomic, strong) NSString* tenor_month;
@property(nonatomic, strong) NSString* secret_key;
@property(nonatomic, strong) NSString* notify_url;
@property(nonatomic, strong) NSString* bin_filter_code;
@property(nonatomic, strong) NSString* token_mod_id;

@property(nonatomic, strong) NSString* Bill_to_forename;
@property(nonatomic, strong) NSString* Bill_to_surname;
@property(nonatomic, strong) NSString* Bill_to_address_city;
@property(nonatomic, strong) NSString* Bill_to_address_line1;
@property(nonatomic, strong) NSString* Bill_to_address_country;
@property(nonatomic, strong) NSString* Bill_to_address_state;
@property(nonatomic, strong) NSString* Bill_to_address_postal_code;
@property(nonatomic, strong) NSString* Bill_to_phone;

- (id) initWithDelegate:(id<DirectAPIDelegate>) delegate;
- (void) startRequest;


@end
/* RDPDirectAPI_h */
