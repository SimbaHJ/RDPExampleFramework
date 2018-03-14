//
//  RDPRedirectAPI.h
//  RDPSDK
//
//  Created by Ferico Samuel on 5/11/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RAPIFirstRequest.h"
#import "RedirectAPIInternalDelegate.h"
#import "RDPRedirectAPIPaymentType.h"
#import "RedirectAPIDelegate.h"
#import "RDPSignatureUtil.h"
#import "RDPHttpPostRequest.h"
#import "RDPUtil.h"
#import "RDPRedirectAPIResponse.h"
#define RDP_RAPI_API_MODE @"redirection_hosted" 
#define RDP_RAPI_DEV_URL @"https://secure-dev.reddotpayment.com/service/payment-api"
#define RDP_RAPI_PRODUCTION_URL @"https://secure.reddotpayment.com/service/payment-api"

@interface RDPRedirectAPI : NSObject<RDPWsDelegate>

@property(nonatomic, strong) NSString* mid;
@property(nonatomic, strong) NSString *payment_type;
@property(nonatomic, strong) NSString* order_id;
@property(nonatomic, strong) NSString* ccy;
@property(nonatomic) float amount;
@property(nonatomic, strong) NSString* back_url;
@property(nonatomic, strong) NSString* redirect_url;
@property(nonatomic, strong) NSString* notify_url;
@property(nonatomic, strong) NSString* payer_email;
@property(nonatomic, strong) NSString* merchant_reference;
@property(nonatomic, strong) NSString* locale;
@property(nonatomic, strong) NSString* multiple_method_page;
@property(nonatomic, strong) NSString* bill_to_forename;
@property(nonatomic, strong) NSString* bill_to_surname;
@property(nonatomic, strong) NSString* bill_to_address_city;
@property(nonatomic, strong) NSString* bill_to_address_line1;
@property(nonatomic, strong) NSString* bill_to_address_line2;
@property(nonatomic, strong) NSString* bill_to_address_country;
@property(nonatomic, strong) NSString* bill_to_address_state;
@property(nonatomic, strong) NSString* bill_to_address_postal_code;
@property(nonatomic, strong) NSString* bill_to_phone;
@property(nonatomic, strong) NSString* ship_to_forename;
@property(nonatomic, strong) NSString* ship_to_surname;
@property(nonatomic, strong) NSString* ship_to_address_city;
@property(nonatomic, strong) NSString* ship_to_address_line1;
@property(nonatomic, strong) NSString* ship_to_address_line2;
@property(nonatomic, strong) NSString* ship_to_address_country;
@property(nonatomic, strong) NSString* ship_to_address_state;
@property(nonatomic, strong) NSString* ship_to_address_postal_code;
@property(nonatomic, strong) NSString* ship_to_phone;
@property(nonatomic, strong) NSString* secret_key;
@property(nonatomic) int tenor_month;
@property(nonatomic, strong) NSString* api_mode;
@property(nonatomic, strong) NSString* payer_id;
@property(nonatomic, strong) NSString* payer_name;
@property(nonatomic, strong) NSString* card_no;
@property(nonatomic, strong) NSString* exp_date;
@property(nonatomic, strong) NSString* cvv2;
@property(nonatomic, strong) NSString* token_mod;
@property(nonatomic, strong) NSString* token_mod_id;

@property(nonatomic, weak)id<RedirectAPIDelegate> delegate;
@property(nonatomic, weak) id<RedirectAPIInternalDelegate> internalDelegate;

- (id) initWithDelegate:(id<RedirectAPIDelegate>) delegate;
- (void) startRequest;
//- (void) checkAmountValidation;


@end
