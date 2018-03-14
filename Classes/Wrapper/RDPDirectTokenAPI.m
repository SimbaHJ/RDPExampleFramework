//
//  RDPDirectTokenAPI.m
//  ExampleRDPSDk
//
//  Created by 霍驹 on 2018/2/24.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import "RDPDirectTokenAPI.h"
#import "RDPDirectTokenAPIResponse.h"
#import "RDPUtil.h"
#import "RDPSignatureUtil.h"
@implementation RDPDirectTokenAPI
- (id) initWithDelegate:(id<RDPDirectTokenAPIDelegate>) delegate {
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
    if(!self.transaction_type)
        [NSException raise:@"Incomplete Variable Binding" format:@"transaction_type can not be nil or empty"];
    if(!self.payer_email || [self.payer_email isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"payer_email can not be nil or empty"];
    if (![self.transaction_type isEqualToString:@"R"]) {
        if(!self.payer_name || [self.payer_name isEqualToString:@""])
            [NSException raise:@"Incomplete Variable Binding" format:@"payer_name can not be nil or empty"];
    }
    
}


- (void) startRequest {
    [self checkVarCompletion];
    NSMutableDictionary* dictionary = [self getParameterDic];
    
    NSURL* url = [[NSURL alloc]initWithString:RDP_DITAPI_DEV_URL];
    if([RDPUtil isProduction])
        url = [[NSURL alloc]initWithString:RDP_DITAPI_PRODUCTION_URL];
    NSData* data = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSString* dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data string: %@", dataString);
    [[RDPHttpPostRequest alloc]initUsingHeader:NO andURL:url andData:data andResponseObject:[[RDPDirectTokenAPIResponse alloc] init] andDelegate:self];
    NSLog(@"request started");
}
- (NSMutableDictionary *)getParameterDic {
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc]init];
    
    [dictionary setValue:self.mid forKey:@"mid"];
    [dictionary setValue:self.order_id forKey:@"order_id"];
    [dictionary setValue:RDP_DITAPI_API_MODE forKey:@"api_mode"];
    [dictionary setValue:self.payer_email forKey:@"payer_email"];
    [dictionary setValue:self.payer_name forKey:@"payer_name"];
    [dictionary setValue:self.transaction_type forKey:@"transaction_type"];
//    if (self.token_type == RDPDirectTokenTypeCreation) {
//        [dictionary setValue:@"C" forKey:@"transaction_type"];
//    }
//    else if (self.token_type == RDPDirectTokenTypeModification){
//        [dictionary setValue:@"M" forKey:@"transaction_type"];
//    }
//    else if (self.token_type == RDPDirectTokenTypeDeletion){
//        [dictionary setValue:@"R" forKey:@"transaction_type"];
//    }
    
    
    if (self.payer_id != nil) {
        [dictionary setValue:self.payer_id forKey:@"payer_id"];
    }
    if (self.ccy != nil) {
        [dictionary setValue:self.ccy forKey:@"ccy"];
    }

    if (self.card_no != nil) {
        [dictionary setValue:self.card_no forKey:@"card_no"];
    }
    if (self.exp_date != nil) {
        [dictionary setValue:self.exp_date forKey:@"exp_date"];
    }
    if (self.cvv2 != nil) {
        [dictionary setValue:self.cvv2 forKey:@"cvv2"];
    }
    if (self.bill_to_forename != nil) {
        [dictionary setValue:self.bill_to_forename forKey:@"bill_to_forename"];
    }
    if (self.bill_to_surname != nil) {
        [dictionary setValue:self.bill_to_surname forKey:@"bill_to_surname"];
    }
    if (self.bill_to_address_city != nil) {
        [dictionary setValue:self.bill_to_address_city forKey:@"bill_to_address_city"];
    }
    if (self.bill_to_address_line1 != nil) {
        [dictionary setValue:self.bill_to_address_line1 forKey:@"bill_to_address_line1"];
    }
    if (self.bill_to_address_country != nil) {
        [dictionary setValue:self.bill_to_address_country forKey:@"bill_to_address_country"];
    }
    if (self.bill_to_address_state != nil) {
        [dictionary setValue:self.bill_to_address_state forKey:@"bill_to_address_state"];
    }
    if (self.bill_to_address_postal_code != nil) {
        [dictionary setValue:self.bill_to_address_postal_code forKey:@"bill_to_address_postal_code"];
    }
    if (self.bill_to_phone != nil) {
        [dictionary setValue:self.bill_to_phone forKey:@"bill_to_phone"];
    }
    if (self.wallet_id != nil) {
        [dictionary setValue:self.wallet_id forKey:@"wallet_id"];
    }
    if (self.merchant_reference != nil) {
        [dictionary setValue:self.merchant_reference forKey:@"merchant_reference"];
    }
    if (self.bill_to_address_line2 != nil) {
        [dictionary setValue:self.bill_to_address_line2 forKey:@"bill_to_address_line2"];
    }
    if (self.notify_url != nil) {
        [dictionary setValue:self.notify_url forKey:@"notify_url"];
    }
    NSString* signatureValue = [RDPSignatureUtil makeSignatureFromParamsWithSHA512:dictionary withSecretKey:self.secret_key];
//    NSString* signatureValue = [SignatureUtil makeSignatureFromParams:dictionary withSecretKey:self.secret_key];
    [dictionary setValue:signatureValue forKey:@"signature"];
    
    
    return dictionary;
}

- (void) onSuccessWith:(RDPWsResponse*)responseObject {
    
    RDPDirectTokenAPIResponse *response = (RDPDirectTokenAPIResponse*) responseObject;
    NSString* generatedSignature = [RDPSignatureUtil makeDAPIGenericSignature:responseObject.jsonObject andSecretKey:self.secret_key];
    if([generatedSignature isEqualToString:response.signature]) {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onRequestFinishedWithResponseObject:)]) {
        [self.delegate onRequestFinishedWithResponseObject:response];
    }
    }else{
        if (self.delegate && [self.delegate respondsToSelector:@selector(onRequestFailedWithErrorCode:andDescription:)]) {
            [self.delegate onRequestFailedWithErrorCode:response.response_code.intValue andDescription:@"Invalid signature received!"];
        }
    }
//    }
//    else {
//        [self.delegate onRequestFailedWithErrorCode:response.response_code.intValue andDescription:@"Invalid signature received!"];
//    }
}

- (void) onErrorWith: (NSString*) error andErrorCode: (NSString*) errorCode andRequest:(id) request {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onRequestFailedWithErrorCode:andDescription:)]) {
        [self.delegate onRequestFailedWithErrorCode:errorCode.intValue andDescription:error];
    }
    
}
- (void) onNoNetwork: (id) request {
    [self.delegate onRequestFailedWithErrorCode:0 andDescription:@"No Internet connection"];
}

@end
