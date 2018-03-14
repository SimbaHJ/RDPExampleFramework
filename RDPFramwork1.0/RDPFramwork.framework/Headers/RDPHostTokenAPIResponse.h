//
//  RDPHostTokenAPIResponse.h
//  ExampleRDPSDk
//
//  Created by 霍驹 on 2018/2/27.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPWsResponse.h"

/**
 Class to represent a response from Host Tokenization API
 */
@interface RDPHostTokenAPIResponse : RDPWsResponse

/**
 The merchant id given by RDP when setting up an account
 */
@property(nonatomic, strong) NSString * mid;

/**
 Indicates the time when the payment-page session is destroyed.
 Example: 1454467459
 */
@property(nonatomic, strong) NSString * expired_timestamp;

/**
 Indicates the time when the payment page is created.
 */
@property(nonatomic, strong) NSString * created_timestamp;

/**
 Echo back the order-id sent in the request.
 */
@property(nonatomic, strong) NSString * order_id;

/**
 The payment page URL where merchant's system need to redirect to.
 */
@property(nonatomic, strong) NSString * payment_url;

/**
 The SHA-512 response signature to proof that the message is coming from RDP.
 */
@property(nonatomic, strong) NSString * signature;


- (void) parse :(NSData*)data;

@end
