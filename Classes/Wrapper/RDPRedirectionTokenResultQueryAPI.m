//
//  RedirectionResultQueryAPI.m
//  ExampleRDP
//
//  Created by 霍驹 on 2018/3/6.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import "RDPRedirectionTokenResultQueryAPI.h"
#import "RDPUtil.h"
#import "RDPSignatureUtil.h"
#import "RDPHttpPostRequest.h"

@implementation RDPRedirectionTokenResultQueryAPI

- (id) initWithDelegate:(id<RDPRedirectionResultQueryDelegate>) delegate {
    self = [super init];
    self.delegate = delegate;
    return self;
}

- (void) checkVarCompletion {
    if(! self.delegate)
        [NSException raise:@"Incomplete Variable Binding" format:@"Delegate has to be set to a class"];
    if(!self.request_mid || [self.request_mid isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"request_mid can not be nil or empty"];
    if(!self.transaction_id || [self.transaction_id isEqualToString:@""])
        [NSException raise:@"Incomplete Variable Binding" format:@"transaction_id can not be nil or empty"];
}
- (void) startRequest {
    [self checkVarCompletion];
    NSString* urlString = RDP_RAPI_QUERY_DEV_URL;
    if([RDPUtil isProduction])
        urlString = RDP_RAPI_QUERY_PRODUCTION_URL;
    
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setObject:self.request_mid forKey:@"request_mid"];
    [dictionary setObject:self.transaction_id forKey:@"transaction_id"];
     NSString* signatureValue = @"";
    signatureValue = [RDPSignatureUtil makeRAPIGenericSignature:dictionary andSecretKey:self.secret_key];
    [dictionary setObject:signatureValue forKey:@"signature"];
    NSData* data = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSString* dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data string: %@", dataString);
   
    
//    urlString = [NSString stringWithFormat:@"%@?request_mid=%@&transaction_id=%@&signature=%@",urlString,self.request_mid,self.transaction_id,signatureValue];
    NSURL* url = [[NSURL alloc]initWithString:urlString];
//    [[RDPHttpGetRequest alloc]initUsingHeader:NO withURL:url andResponseObject:[[RDPRedirectionResultQueryResponse alloc]init] andDelegate:self];
    [[RDPHttpPostRequest alloc] initUsingHeader:NO andURL:url andData:data andResponseObject:[[RDPRedirectionResultQueryResponse alloc]init] andDelegate:self];
}

- (void) onSuccessWith:(RDPWsResponse*)responseObject {
    
    RDPRedirectionResultQueryResponse *response = (RDPRedirectionResultQueryResponse*) responseObject;
    NSString* generatedSignature = [RDPSignatureUtil makeRAPIGenericSignature:responseObject.jsonObject andSecretKey:self.secret_key];
    if([generatedSignature isEqualToString:response.signature]) {
        if(self.delegate && [self.delegate respondsToSelector:@selector(onRequestFinishedWithResponseObject:)])
        [self.delegate onRequestFinishedWithResponseObject:response];
    }
    else{
        [self.delegate onRequestFailedWithErrorCode:response.response_code.intValue andDescription:@"Invalid signature received!"];
    }
}

- (void) onErrorWith: (NSString*) error andErrorCode: (NSString*) errorCode andRequest:(id) request {
    [self.delegate onRequestFailedWithErrorCode:errorCode.intValue andDescription:error];
}

- (void) onNoNetwork: (id) request {
    [self.delegate onRequestFailedWithErrorCode:0 andDescription:@"No Internet connection"];
}


@end
