//
//  RDPDirectAPI.m
//  RDPSDK
//
//  Created by Ricky Putra Harlim on 5/17/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import "RDPDirectAPI.h"
#import "RDPSignatureUtil.h"
@implementation RDPDirectAPI

- (id) initWithDelegate:(id<DirectAPIDelegate>) delegate {
    self = [super init];
    self.delegate = delegate;
    return self;
}


- (void) checkAmountValidation{
    if([self.ccy isEqualToString:@"THB"] && self.amount != (int)self.amount){
        [self onErrorWith:@"Incorrect currency amount" andErrorCode:@"0" andRequest:nil];
    }
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
    if(!self.payer_email || [self.payer_email isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"payer_email can not be nil or empty"];
}

- (void) startRequest {
    [self checkVarCompletion];
    [self checkAmountValidation];
    if(self.delegate && [self.delegate respondsToSelector:@selector(paymentInterfaceWillRequest)])
        [self.delegate paymentInterfaceWillRequest];
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc]init];
   
    [dictionary setValue:self.mid forKey:@"mid"];
    [dictionary setValue:self.order_id forKey:@"order_id"];
    [dictionary setValue:RDP_DAPI_API_MODE forKey:@"api_mode"];
    
    
//    if(self.payment_type == RDPDirectPaymentTypeSale ) {
//        [dictionary setValue:@"S" forKey:@"payment_type"];
//    }
//    else if(self.payment_type == RDPDirectPaymentTypeInstallment)
//        [dictionary setValue:@"I" forKey:@"payment_type"];
//    else if(self.payment_type == RDPDirectPaymentTypeAuthorization)
//        [dictionary setValue:@"A" forKey:@"payment_type"];
    [dictionary setValue:self.ccy forKey:@"ccy"];
    [dictionary setValue:[NSString stringWithFormat:@"%.2f", self.amount] forKey:@"amount"];
    [dictionary setValue:self.payer_email forKey:@"payer_email"];
    
    if(self.payment_type != nil && ![self.payment_type isEqualToString:@""])
        [dictionary setValue:self.payment_type forKey:@"payment_type"];
    if(self.card_no != nil && ![self.card_no isEqualToString:@""])
        [dictionary setValue:self.card_no forKey:@"card_no"];
    if(self.exp_date != nil && ![self.exp_date isEqualToString:@""])
        [dictionary setValue:self.exp_date forKey:@"exp_date"];
    if(self.payer_name != nil && ![self.payer_name isEqualToString:@""])
        [dictionary setValue:self.payer_name forKey:@"payer_name"];
    if(self.payer_id != nil&& ![self.payer_id isEqualToString:@""])
        [dictionary setValue:self.payer_id forKey:@"payer_id"];
    if(self.cvv2 != nil && ![self.cvv2 isEqualToString:@""])
        [dictionary setValue:self.cvv2 forKey:@"cvv2"];
    if(self.token_id != nil&& ![self.token_id isEqualToString:@""])
        [dictionary setValue:self.token_id forKey:@"token_id"];
    if(self.token_mod != nil&& ![self.token_mod isEqualToString:@""])
        [dictionary setValue:self.token_mod forKey:@"token_mod"];
    if(self.merchant_reference != nil && ![self.merchant_reference isEqualToString:@""])
        [dictionary setValue:self.merchant_reference forKey:@"merchant_reference"];
    if(self.client_ip_address != nil&& ![self.client_ip_address isEqualToString:@""])
        [dictionary setValue:self.client_ip_address forKey:@"client_ip_address"];
    if(self.client_user_agent != nil&& ![self.client_user_agent isEqualToString:@""])
        [dictionary setValue:self.client_user_agent forKey:@"client_user_agent"];
    if(self.tenor_month != nil&& ![self.tenor_month isEqualToString:@""])
        [dictionary setValue:self.tenor_month forKey:@"tenor_month"];
    if(self.token_mod_id != nil&& ![self.token_mod_id isEqualToString:@""])
        [dictionary setValue:self.token_mod_id forKey:@"token_mod_id"];
    if(self.notify_url != nil&& ![self.notify_url isEqualToString:@""])
        [dictionary setValue:self.notify_url forKey:@"notify_url"];
    if(self.bin_filter_code != nil&& ![self.bin_filter_code isEqualToString:@""])
        [dictionary setValue:self.bin_filter_code forKey:@"bin_filter_code"];
  
    NSString* amount = [dictionary valueForKey:@"amount"];
    NSString* paymentType = [dictionary valueForKey:@"payment_type"];
    NSString* signatureValue = [NSString alloc];
    if(self.card_no != nil){
        signatureValue = [RDPSignatureUtil makeDAPISignatureWithCardModeWithMid:self.mid andOrderId:self.order_id andPaymentType:paymentType andAmount:amount andCcy:self.ccy andSecretKey:self.secret_key andCardNo:self.card_no andExpDate:self.exp_date andCvv2:self.cvv2];
    }else if (self.payer_id != nil){
        signatureValue = [RDPSignatureUtil makeDAPISignatureWithTokenModeWithMid:self.mid andOrderId:self.order_id andPaymentType:paymentType andAmount:amount andCcy:self.ccy andSecretKey:self.secret_key andPayer_id:self.payer_id andExpDate:self.exp_date andCvv2:self.cvv2];
    }else if(self.token_id != nil){
        signatureValue = [RDPSignatureUtil makeDAPISignatureWithTokenModeWithMid:self.mid andOrderId:self.order_id andPaymentType:paymentType andAmount:amount andCcy:self.ccy andSecretKey:self.secret_key andTokenid:self.token_id andExpDate:self.exp_date andCvv2:self.cvv2];
    }
    
    [dictionary setValue:signatureValue forKey:@"signature"];
    
    NSData* data = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSString* dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data string: %@", dataString);
    
    NSURL* url = [[NSURL alloc]initWithString:RDP_DAPI_DEV_URL];
    if([RDPUtil isProduction])
        url = [[NSURL alloc]initWithString:RDP_DAPI_PRODUCTION_URL];
    
    [[RDPHttpPostRequest alloc]initUsingHeader:NO andURL:url andData:data andResponseObject:[[RDPDirectAPIResponse alloc] init] andDelegate:self];
    NSLog(@"request started");
}


- (void) onSuccessWith:(RDPWsResponse*)responseObject {
    if(self.delegate && [self.delegate respondsToSelector:@selector(paymentInterfaceDidRequest)])
        [self.delegate paymentInterfaceDidRequest];
    RDPDirectAPIResponse *response = (RDPDirectAPIResponse*) responseObject;
    NSString* generatedSignature = [RDPSignatureUtil makeDAPIGenericSignature:responseObject.jsonObject andSecretKey:self.secret_key];
    if([generatedSignature isEqualToString:response.signature]) {
        [self.delegate onRequestFinishedWithResponseObject:response];
    }
    else {
        [self.delegate onRequestFailedWithErrorCode:response.response_code.intValue andDescription:@"Invalid signature received!"];
    }
}

- (void) onErrorWith: (NSString*) error andErrorCode: (NSString*) errorCode andRequest:(id) request {
    [self.delegate onRequestFailedWithErrorCode:errorCode.intValue andDescription:error];
}

- (void) onNoNetwork: (id) request {
    [self.delegate onRequestFailedWithErrorCode:0 andDescription:@"No Internet connection"];
}


- (void) signatureWillValidate {
    if(self.delegate && [self.delegate respondsToSelector:@selector(transactionSignatureWillValidate)])
        [self.delegate transactionSignatureWillValidate];
}

- (void) signatureDidValidateWithParam: (NSDictionary*) params{
    if(self.delegate && [self.delegate respondsToSelector:@selector(transactionSignatureDidValidateWithParam:)])
        [self.delegate transactionSignatureDidValidateWithParam:params];
}

@end
