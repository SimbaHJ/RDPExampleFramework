//
//  RDPRedirectAPI.m
//  RDPSDK
//
//  Created by Ferico Samuel on 5/11/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import "RDPRedirectAPI.h"
#import "RDPRedirectAPIPaymentType.h"

@implementation RDPRedirectAPI

- (id) initWithDelegate:(id<RedirectAPIDelegate>) delegate {
    self = [super init];
    self.delegate = delegate;
    return self;
}

- (void) checkVarCompletion {
    if(! self.delegate)
        [NSException raise:@"Incomplete Variable Binding" format:@"Delegate has to be set to a class"];
    if(!self.mid || [self.mid isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"mid can not be nil or empty"];
    if(!self.order_id || [self.order_id isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"order_id can not be nil or empty"];
    if(!self.amount || self.amount == 0)
        [NSException raise:@"Incomplete Variable Binding" format:@"amount can not be nil or 0"];
    if(!self.ccy || [self.ccy isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"ccy can not be nil or empty"];
    if(!self.back_url || [self.back_url isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"back_url can not be nil or empty"];
    if(!self.redirect_url || [self.redirect_url isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"redirect_url can not be nil or empty"];
    if(!self.notify_url || [self.notify_url isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"notify_url can not be nil or empty"];
    if(!self.secret_key || [self.secret_key isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"secret_key can not be nil or empty"];
    if(!self.api_mode || [self.api_mode isEqualToString:@""])
    [NSException raise:@"Incomplete Variable Binding" format:@"api_mode can not be nil or empty"];
    if(!self.payment_type || [self.payment_type isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"payment_type can not be nil or empty"];
    if(!self.api_mode || [self.api_mode isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"api_mode can not be nil or empty"];
    
}


- (void)checkAmoutValidation{
    if([self.ccy isEqualToString:@"THB"] && self.amount != (int)self.amount){
        [self.internalDelegate onRequestFailed];
        [self.delegate onRequestFailedWithErrorCode:0 andDescription:@"Incorrect currency amount"];
    }
}

- (void) startRequest {
    [self checkVarCompletion];
    if(self.delegate && [self.delegate respondsToSelector:@selector(paymentInterfaceWillRequest)])
        [self.delegate paymentInterfaceWillRequest];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setValue:self.mid forKey:@"mid"];
    [dictionary setValue:self.api_mode forKey:@"api_mode"];
//    if(self.payment_type == RDPRAPIPaymentTypeSale)
//        [dictionary setValue:@"S" forKey:@"payment_type"];
//    else if (self.payment_type == RDPRAPIPaymentTypeAuthorization)
//        [dictionary setValue:@"A" forKey:@"payment_type"];
//    else
//        [dictionary setValue:@"I" forKey:@"payment_type"];
   
    [dictionary setValue:self.order_id forKey:@"order_id"];
    [dictionary setValue:self.ccy forKey:@"ccy"];
    if([self.ccy isEqualToString:@"THB"]){
        [dictionary setValue:[NSString stringWithFormat:@"%.0f", self.amount] forKey:@"amount"];
    }else{
        [dictionary setValue:[NSString stringWithFormat:@"%.02f", self.amount] forKey:@"amount"];
    }
    [dictionary setValue:self.back_url forKey:@"back_url"];
    [dictionary setValue:self.redirect_url forKey:@"redirect_url"];
    [dictionary setValue:self.notify_url forKey:@"notify_url"];
    if(self.payment_type != nil && ![self.payment_type isEqualToString:@""])
        [dictionary setValue:self.payment_type forKey:@"payment_type"];
    if(self.payer_email != nil && ![self.payer_email isEqualToString:@""])
        [dictionary setValue:self.payer_email forKey:@"payer_email"];
    if(self.merchant_reference != nil&& ![self.merchant_reference isEqualToString:@""])
        [dictionary setValue:self.merchant_reference forKey:@"merchant_reference"];
    if(self.locale != nil&& ![self.locale isEqualToString:@""])
        [dictionary setValue:self.locale forKey:@"locale"];
    if(self.locale != nil&& ![self.locale isEqualToString:@""])
        [dictionary setValue:self.locale forKey:@"locale"];
    if(self.multiple_method_page != nil && ![self.multiple_method_page isEqualToString:@""])
        [dictionary setValue:self.multiple_method_page forKey:@"multiple_method_page"];
    if(self.bill_to_forename != nil&& ![self.bill_to_forename isEqualToString:@""])
        [dictionary setValue:self.bill_to_forename forKey:@"bill_to_forename"];
    if(self.bill_to_surname != nil&& ![self.bill_to_surname isEqualToString:@""])
        [dictionary setValue:self.bill_to_surname forKey:@"bill_to_surname"];
    if(self.bill_to_address_city != nil&& ![self.bill_to_address_city isEqualToString:@""])
        [dictionary setValue:self.bill_to_address_city forKey:@"bill_to_address_city"];
    if(self.bill_to_address_line1 != nil&& ![self.bill_to_address_line1 isEqualToString:@""])
        [dictionary setValue:self.bill_to_address_line1 forKey:@"bill_to_address_line1"];
    if(self.bill_to_address_line2 != nil&& ![self.bill_to_address_line2 isEqualToString:@""])
        [dictionary setValue:self.bill_to_address_line2 forKey:@"bill_to_address_line2"];
    if(self.bill_to_address_country != nil&& ![self.bill_to_address_country isEqualToString:@""])
        [dictionary setValue:self.bill_to_address_country forKey:@"bill_to_address_country"];
    if(self.bill_to_address_state != nil&& ![self.bill_to_address_state isEqualToString:@""])
        [dictionary setValue:self.bill_to_address_state forKey:@"bill_to_address_state"];
    if(self.bill_to_address_postal_code != nil&& ![self.bill_to_address_postal_code isEqualToString:@""])
        [dictionary setValue:self.bill_to_address_postal_code forKey:@"bill_to_address_postal_code"];
    if(self.bill_to_phone != nil&& ![self.bill_to_phone isEqualToString:@""])
        [dictionary setValue:self.bill_to_phone forKey:@"bill_to_phone"];
    if(self.ship_to_forename != nil&& ![self.ship_to_forename isEqualToString:@""])
        [dictionary setValue:self.ship_to_forename forKey:@"ship_to_forename"];
    if(self.ship_to_surname != nil&& ![self.ship_to_surname isEqualToString:@""])
        [dictionary setValue:self.ship_to_surname forKey:@"ship_to_surname"];
    if(self.ship_to_address_city != nil&& ![self.ship_to_address_city isEqualToString:@""])
        [dictionary setValue:self.ship_to_address_city forKey:@"ship_to_address_city"];
    if(self.ship_to_address_line1 != nil&& ![self.ship_to_address_line1 isEqualToString:@""])
        [dictionary setValue:self.ship_to_address_line1 forKey:@"ship_to_address_line1"];
    if(self.ship_to_address_line2 != nil&& ![self.ship_to_address_line2 isEqualToString:@""])
        [dictionary setValue:self.ship_to_address_line2 forKey:@"ship_to_address_line2"];
    if(self.ship_to_address_country != nil&& ![self.ship_to_address_country isEqualToString:@""])
        [dictionary setValue:self.ship_to_address_country forKey:@"ship_to_address_country"];
    if(self.ship_to_address_state != nil&& ![self.ship_to_address_state isEqualToString:@""])
        [dictionary setValue:self.ship_to_address_state forKey:@"ship_to_address_state"];
    if(self.ship_to_address_postal_code != nil&& ![self.ship_to_address_postal_code isEqualToString:@""])
        [dictionary setValue:self.ship_to_address_postal_code forKey:@"ship_to_address_postal_code"];
    if(self.ship_to_phone != nil&& ![self.ship_to_phone isEqualToString:@""])
        [dictionary setValue:self.ship_to_phone forKey:@"ship_to_phone"];
    if(self.tenor_month != 0)
        [dictionary setValue:[NSString stringWithFormat:@"%d", self.tenor_month] forKey:@"tenor_month"];
    if(self.payer_name != nil&& ![self.payer_name isEqualToString:@""])
        [dictionary setValue:[NSString stringWithFormat:@"%@", self.payer_name] forKey:@"payer_name"];
    if(self.card_no != nil&& ![self.card_no isEqualToString:@""])
        [dictionary setValue:[NSString stringWithFormat:@"%@", self.card_no] forKey:@"card_no"];
    if(self.exp_date != nil&& ![self.exp_date isEqualToString:@""])
        [dictionary setValue:[NSString stringWithFormat:@"%@", self.exp_date] forKey:@"exp_date"];
    if(self.cvv2 != nil&& ![self.cvv2 isEqualToString:@""])
        [dictionary setValue:[NSString stringWithFormat:@"%@", self.cvv2] forKey:@"cvv2"];
    if(self.token_mod != nil&& ![self.token_mod isEqualToString:@""])
        [dictionary setValue:[NSString stringWithFormat:@"%@", self.token_mod] forKey:@"token_mod"];
    if(self.token_mod_id != nil&& ![self.token_mod_id isEqualToString:@""])
        [dictionary setValue:[NSString stringWithFormat:@"%@", self.token_mod_id] forKey:@"token_mod_id"];
    
    
    NSString* amount = [dictionary valueForKey:@"amount"];
    NSString* paymentType = [dictionary valueForKey:@"payment_type"];
//    NSString * signature = @"bfedd79ba2acf216473e5fb9ab20b90dfa57f0e21085c5c157fc51ae54d4b7a4f6602912dd227de174a004b0e6dffb90b75edc10f7fd6fd88f78c92bb7bdff74";
    NSString* signature = nil;
    if ([self.api_mode isEqualToString:@"redirection_hosted"]) {
    signature = [RDPSignatureUtil makeRAPISignatureWithMid:self.mid andOrderId:self.order_id andPaymentType:paymentType andAmount:amount andCcy:self.ccy andSecretKey:self.secret_key andCardNumber:nil andExpDate:self.exp_date andCvv:self.cvv2 andPayer_id:self.payer_id];
    }else if ([self.api_mode isEqualToString:@"redirection_sop"]){
        signature = [RDPSignatureUtil makeRAPISignatureWithMid:self.mid andOrderId:self.order_id andPaymentType:paymentType andAmount:amount andCcy:self.ccy andSecretKey:self.secret_key andCardNumber:self.card_no andExpDate:self.exp_date andCvv:self.cvv2 andPayer_id:self.payer_id];
    }
    
//    NSString* signature = [SignatureUtil makeDAPISignatureWithCardModeWithMid:self.mid andOrderId:self.order_id andPaymentType:paymentType andAmount:amount andCcy:self.ccy andSecretKey:self.secret_key andCardNo:self.card_no andExpDate:self.exp_date andCvv2:self.cvv2];
    [dictionary setValue:signature forKey:@"signature"];
    
    NSData* data = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSString* dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data string: %@", dataString);
    
    NSString* urlString = RDP_RAPI_DEV_URL;
    if([RDPUtil isProduction]){
        urlString = RDP_RAPI_PRODUCTION_URL;
    }
    
    NSURL* url = [[NSURL alloc]initWithString:urlString];

    [[RDPHttpPostRequest alloc] initUsingHeader:NO andURL:url andData:data andResponseObject:[[RDPRedirectAPIResponse alloc]init] andDelegate:self];
}

- (void) onSuccessWith:(RDPWsResponse*)responseObject {
    if(self.delegate && [self.delegate respondsToSelector:@selector(paymentInterfaceDidRequest)])
        [self.delegate paymentInterfaceDidRequest];
    
    RDPRedirectAPIResponse *response = (RDPRedirectAPIResponse*) responseObject;
    NSString* generatedSignature = [RDPSignatureUtil makeRAPIGenericSignature:responseObject.jsonObject andSecretKey:self.secret_key];
    if([generatedSignature isEqualToString:response.signature]) {
        if(self.delegate && [self.delegate respondsToSelector:@selector(paymentUrlWillLoad)])
            [self.delegate paymentUrlWillLoad];
            [self.internalDelegate onPaymentURLReceived:response.payment_url];
            [self.delegate onRequestFinishedWithResponseObject:response];
    }
    else{
        [self.internalDelegate onRequestFailed];
        [self.delegate onRequestFailedWithErrorCode:response.response_code.intValue andDescription:@"Invalid signature received!"];
    }
}

- (void) onErrorWith: (NSString*) error andErrorCode: (NSString*) errorCode andRequest:(id) request {
    [self.internalDelegate onRequestFailed];
    [self.delegate onRequestFailedWithErrorCode:errorCode.intValue andDescription:error];
}

- (void) onNoNetwork: (id) request {
    [self.internalDelegate onRequestFailed];
    [self.delegate onRequestFailedWithErrorCode:0 andDescription:@"No Internet connection"];
}


@end
