//
//  SignatureValidator.m
//  RDPSDK
//
//  Created by Ferico Samuel on 5/3/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import "RDPSignatureUtil.h"
#import "RDPSHA512Calculator.h"

@implementation RDPSignatureUtil

+ (NSString*) makeSignatureFromParams:(NSDictionary*)params withSecretKey:(NSString*)secretKey {
    NSArray* keys = [params allKeys];
    NSArray* sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(NSString* a, NSString* b) {
        return [a compare:b];
    }];
    
    NSMutableString* queryString = [[NSMutableString alloc]init];
    for(NSString* key in sortedKeys) {
        if([key isEqualToString:@"signature"])
            continue;
        [queryString appendString:key];
        [queryString appendString:@"="];
        [queryString appendString:[params valueForKey:key]];
        [queryString appendString:@"&"];
    }
    
    [queryString appendString:@"secret_key="];
    [queryString appendString:secretKey];
    
    return [[RDPMD5Calculator calculateFrom:queryString] lowercaseString];
}

+ (NSString*) makeSignatureFromParamsWithSHA512:(NSDictionary*)params withSecretKey:(NSString*)secretKey {
    NSArray* keys = [params allKeys];
    NSArray* sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(NSString* a, NSString* b) {
        return [a compare:b];
    }];
    
    NSMutableString* queryString = [[NSMutableString alloc]init];
//    [queryString appendString:@".="];
    for(NSString* key in sortedKeys) {
        if([key isEqualToString:@"signature"])
            continue;
//        [queryString appendString:key];
//        [queryString appendString:@"="];
        
        [queryString appendString:[params valueForKey:key]];
//        [queryString appendString:@""];
    }
    
//    [queryString appendString:@"secret_key="];
    [queryString appendString:secretKey];
    
    return [RDPSHA512Calculator createSHA512:queryString];
}

+ (bool) matchSignature:(NSString*) signature withParams:(NSDictionary*)params andSecretKey:(NSString*) secretKey {
    return [signature isEqualToString:[self makeSignatureFromParams:params withSecretKey:secretKey]];
}

+ (bool) isSignatureValidatedWithQueryString:(NSString*) queryString andSecretKey:(NSString*) secretKey {
    queryString = [queryString componentsSeparatedByString:@"?"][1];
    NSMutableDictionary* params = [[NSMutableDictionary alloc]init];
    NSArray* paramArray = [queryString componentsSeparatedByString:@"&"];
    for(NSString* param in paramArray) {
        NSArray* keyValue = [param componentsSeparatedByString:@"="];
        [params setValue:keyValue[1] forKey:keyValue[0]];
    }
    
    NSString* signature = [params valueForKey:@"signature"];
    return [self matchSignature:signature withParams:params andSecretKey:secretKey];
}

+ (NSString*) makeRAPISignatureWithMid:(NSString*) mid andOrderId:(NSString*) order_id andPaymentType:(NSString*) payment_type andAmount:(NSString*)amount andCcy:(NSString*) ccy andSecretKey:(NSString*) secret_key andCardNumber:(NSString*) cardNumber andExpDate:(NSString*) expDate andCvv:(NSString*) cvv andPayer_id:(NSString*)payer_id {
    NSMutableString* key = [[NSMutableString alloc]init];
    [key appendString:mid];
    [key appendString:order_id];
    [key appendString:payment_type];
    [key appendString:amount];
    [key appendString:ccy];
    if(payer_id && ![payer_id isEqualToString:@""]) {
//        NSString* card = [cardNumber substringToIndex:6];
//        card = [card stringByAppendingString:[cardNumber substringFromIndex: cardNumber.length - 4]];
//        [key appendString:card];
//        [key appendString:expDate];
        [key appendString:payer_id];
        [key appendString: [cvv substringFromIndex:cvv.length - 1]];
    }else if (cardNumber && ![cardNumber isEqualToString:@""] && expDate && ![expDate isEqualToString:@""] && cvv && ![cvv isEqualToString:@""] && cvv.length > 2){
        NSString* card = [cardNumber substringToIndex:6];
        card = [card stringByAppendingString:[cardNumber substringFromIndex: cardNumber.length - 4]];
        [key appendString:card];
        [key appendString:expDate];
        [key appendString: [cvv substringFromIndex:cvv.length - 1]];
    }
    [key appendString:secret_key];
    return [RDPSHA512Calculator createSHA512:key];
}



+ (NSString*) makeRAPIGenericSignature:(NSDictionary*) param andSecretKey:(NSString*) secret_key {
    NSMutableString* raw = [[NSMutableString alloc] initWithString:[self generateGenericSignatureRawString:param]];
    [raw appendString:secret_key];
    
    return [RDPSHA512Calculator createSHA512:raw];
}

+ (NSString*) makeDAPIGenericSignature:(NSDictionary*) param andSecretKey:(NSString*) secret_key{
    NSMutableString* raw = [[NSMutableString alloc] initWithString:[self generateGenericSignatureRawString:param]];
    [raw appendString:secret_key];
    return [RDPSHA512Calculator createSHA512:raw];

}

+ (bool) isRAPIGenericSignatureValidatedWithParams: (NSDictionary*) params andSecretKey:(NSString*) secret_key {
    NSString* generatedSignature = [RDPSignatureUtil makeRAPIGenericSignature:params andSecretKey:secret_key];
    NSString* signature = [params objectForKey:@"signature"];
    if([generatedSignature isEqualToString:signature])
        return true;
    return false;
}

+ (NSString*) generateGenericSignatureRawString:(id)params {
    if([params isKindOfClass:[NSString class]])
        return params;
    NSArray* keys = [params allKeys];
    NSArray* sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(NSString* a, NSString* b) {
        return [a compare:b];
    }];
    
    NSMutableString* result = [[NSMutableString alloc]init];
    for(NSString* key in sortedKeys) {
        if([key isEqualToString:@"signature"])
            continue;
        if([params valueForKey:key] == nil)
            continue;
        
        if([[params valueForKey:key] isKindOfClass:[NSString class]])
            [result appendString:[params valueForKey:key]];
        else if([[params valueForKey:key] isKindOfClass:[NSNumber class]]) {
            NSNumber *number = [params valueForKey:key];
            [result appendString:number.stringValue];
        }
        else if([[params valueForKey:key] isKindOfClass:[NSArray class]]) {
            NSArray* arr = [params valueForKey:key];
            for(id obj in arr)
                [result appendString:[self generateGenericSignatureRawString:obj]];
        }
        else
            [result appendString:[self generateGenericSignatureRawString:[params valueForKey:key]]];
    }
    return result;
}

+ (NSString*) makeDAPISignatureWithCardModeWithMid:(NSString*) mid andOrderId:(NSString*) order_id andPaymentType:(NSString*) payment_type andAmount:(NSString*)amount andCcy:(NSString*) ccy andSecretKey:(NSString*) secret_key andCardNo:(NSString*)cardNo andExpDate:(NSString*)exp_date andCvv2:(NSString*)cvv2{
    NSMutableString* key = [[NSMutableString alloc]init];
    [key appendString:mid];
    [key appendString:order_id];
    [key appendString:payment_type];
    [key appendString:amount];
    [key appendString:ccy];
    [key appendString:[cardNo substringWithRange:NSMakeRange(0, 6)]];
    [key appendString:[cardNo substringWithRange:NSMakeRange(cardNo.length-4, 4)]];
    [key appendString:exp_date];
    [key appendString:[cvv2 substringFromIndex:cvv2.length-1]];
    [key appendString:secret_key];
    return [RDPSHA512Calculator createSHA512:key];
}
+ (NSString*) makeDAPISignatureWithTokenModeWithMid:(NSString*) mid andOrderId:(NSString*) order_id andPaymentType:(NSString*) payment_type andAmount:(NSString*)amount andCcy:(NSString*) ccy andSecretKey:(NSString*) secret_key andTokenid:(NSString*)token_id andExpDate:(NSString*)exp_date andCvv2:(NSString*)cvv2{
    NSMutableString* key = [[NSMutableString alloc]init];
    [key appendString:mid];
    [key appendString:order_id];
    [key appendString:payment_type];
    [key appendString:amount];
    [key appendString:ccy];
    [key appendString:[token_id substringWithRange:NSMakeRange(0, 6)]];
    [key appendString:[token_id substringWithRange:NSMakeRange(token_id.length-4, 4)]];
    if(exp_date && ![exp_date isEqualToString:@""]){
        [key appendString:exp_date];
    }
    if(cvv2 && ![cvv2 isEqualToString:@""]){
        [key appendString:[cvv2 substringFromIndex:cvv2.length-1]];
    }
    [key appendString:secret_key];
    return [RDPSHA512Calculator createSHA512:key];
}

+ (NSString*) makeDAPISignatureWithTokenModeWithMid:(NSString*) mid andOrderId:(NSString*) order_id andPaymentType:(NSString*) payment_type andAmount:(NSString*)amount andCcy:(NSString*) ccy andSecretKey:(NSString*) secret_key andPayer_id:(NSString*)payer_id andExpDate:(NSString*)exp_date andCvv2:(NSString*)cvv2{
    NSMutableString* key = [[NSMutableString alloc]init];
    [key appendString:mid];
    [key appendString:order_id];
    [key appendString:payment_type];
    [key appendString:amount];
    [key appendString:ccy];
    [key appendString:payer_id];
//    [key appendString:[token_id substringWithRange:NSMakeRange(token_id.length-4, 4)]];
    if(exp_date && ![exp_date isEqualToString:@""]){
        [key appendString:exp_date];
    }
    if(cvv2 && ![cvv2 isEqualToString:@""]){
        [key appendString:[cvv2 substringFromIndex:cvv2.length-1]];
    }
    [key appendString:secret_key];
    return [RDPSHA512Calculator createSHA512:key];
}


//+ (NSString*) makeDAPISignatureWithTokenMode:(NSString*) mid andOrderId:(NSString*) order_id andPaymentType:(NSString*) payment_type andAmount:(NSString*)amount andCcy:(NSString*) ccy andSecretKey:(NSString*) secret_key{

@end
