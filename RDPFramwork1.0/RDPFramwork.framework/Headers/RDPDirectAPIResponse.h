//
//  RDPDirectAPIResponse.h
//  RDPSDK
//
//  Created by Ferico Samuel on 5/29/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPWsResponse.h"
#import "RDPDirectAPIResponse.h"
/**
 Class to represent a response from Direct API (DAPI)
 */
@interface RDPDirectAPIResponse : RDPWsResponse
/**
 	The merchant id that generated by RDP for merchant.
 */
@property(nonatomic, strong) NSString* mid;
/**
	Merchant’s order-id for the transaction as the identifier of the transaction.
	Recommended to be unique for each case of transaction.
 */
@property(nonatomic, strong) NSString* order_id;
/**
	The RDP generated unique transaction-id, which is used heavily for identifying the resulted transaction in RDP system.
 */
@property(nonatomic, strong) NSString* transaction_id;
/**
	The amount as is sent in the request
 */
@property(nonatomic, strong) NSString* request_amount;
/**
	The currency as is sent in the request
 */
@property(nonatomic, strong) NSString* request_ccy;
/**
	The amount after applying all of others RDP features.
 */
@property(nonatomic, strong) NSString* authorized_amount;
/**
	The final currency that is going to be communicated to Bank/Acquirer.
 */
@property(nonatomic, strong) NSString* authorized_ccy;
/**
	The transaction type as is sent in the request
 */
@property(nonatomic, strong) NSString* transaction_type;
/**
	Response code from acquirer. Format is specific to each Acquirer
 */
@property(nonatomic, strong) NSString* acquirer_response_code;
/**
	Description of the response code
 */
@property(nonatomic, strong) NSString* acquirer_response_msg;
/**
	The response signature.
 */
@property(nonatomic, strong) NSString* signature;
/**
	The amount authorized by acquirer
 */
@property(nonatomic, strong) NSString* acquirer_authorized_amount;
/**
	The currency authorized by Acquirer.
 */
@property(nonatomic, strong) NSString* acquirer_authorized_ccy;
/**
	The merchant_reference in the request
 */
@property(nonatomic, strong) NSString* merchant_reference;
/**
	The datetime when the response is created. In a 24 hour format. Timezone vary depends on Acquirer
 */
@property(nonatomic, strong) NSString* acquirer_created_timestamp;
/**
	The transaction ID generated by Acquirer.
 */
@property(nonatomic, strong) NSString* acquirer_transaction_id;
/**
	The authorization code from the Bank. Only when it is available from the Bank response.
 */
@property(nonatomic, strong) NSString* acquirer_authorization_code;
/**
	The first 6 digits of card_no
 */
@property(nonatomic, strong) NSString* first_6;
/**
	The last 4 digits of card_no
 */
@property(nonatomic, strong) NSString* last_4;
/**
	The name of card-holder
 */
@property(nonatomic, strong) NSString* payer_name;
/**
	The expiry date of the card used for transaction
 */
@property(nonatomic, strong) NSString* exp_date;
/**
	The datetime when the response is created
 */
@property(nonatomic, strong) NSString* created_timestamp;
/**
	 Method that called to parse response data from response RDP API
	 @param data the object that will this method parse to parse and get that value 
 */
- (void) parse :(NSData*)data;

@end
