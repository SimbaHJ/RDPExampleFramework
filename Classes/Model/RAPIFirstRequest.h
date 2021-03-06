//
//  RAPIFirstRequest.h
//  RDPSDK
//
//  Created by Ferico Samuel on 5/11/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPRedirectAPI.h"
#import "RDPRedirectAPIPaymentType.h"
/**
 Class to represent a request property from Redirect API (RAPI) Request
 */
@interface RAPIFirstRequest : NSObject
/**
 The merchant id that generated by RDP for merchant.
 */
@property(nonatomic, strong) NSString* mid;
/**
 The api_mode for Direct n3d mode : direct_n3d.
 */
@property(nonatomic, strong) NSString* api_mode;
/**
	The RDPRedirectAPIPaymentType the payment type that will sent as a request
 */
@property(nonatomic) enum RDPRedirectAPIPaymentType payment_type;
/**
	Merchant’s order-id for the transaction as the identifier of the transaction.
	Recommended to be unique for each case of transaction.
 */
@property(nonatomic, strong) NSString* order_id;
/**
	The currency
 */
@property(nonatomic, strong) NSString* ccy;
/**
	The amount of payment that will request
 */
@property(nonatomic) float amount;
/**
	Merchant's site URL where customer is to be redirected when they chose to press "back" button on RDP's payment page
*/
@property(nonatomic, strong) NSString* back_url;
/**
	Merchant's site URL where RDP is going to redirect Customer once a final result has been received from Bank/Acquirer
*/
@property(nonatomic, strong) NSString* redirect_url;
/**
	Merchant's site URL where a notification will received once a final result of the payment transaction is acquired.
*/
@property(nonatomic, strong) NSString* notify_url;
/**
	This field is optional. Use this field to inform the email of customer. 
*/
@property(nonatomic, strong) NSString* payer_email;
/**
	Any kind of extra information for merchant to relate with this transaction.
*/
@property(nonatomic, strong) NSString* merchant_reference;
/**
	Support Languange 
*/
@property(nonatomic, strong) NSString* locale;
/**
	By default it has the value of 1, which means using the multiple mode page for cardholder to see the payment-summary and choose their payment method (if Merchant use multiple payment method with RDP Gateway)
*/
@property(nonatomic, strong) NSString* multiple_method_page;
/**
	the forename to whom the transaction is being billed.
*/
@property(nonatomic, strong) NSString* bill_to_forename;
/**
    the surname to whom the transaction is being billed.
*/
@property(nonatomic, strong) NSString* bill_to_surname;
/**
	the city where the transaction is being billed.
*/
@property(nonatomic, strong) NSString* bill_to_address_city;
/**
    the first line of street address where the transaction is being billed.
*/
@property(nonatomic, strong) NSString* bill_to_address_line1;
/**
	the second line of street address where the transaction is being billed.
*/
@property(nonatomic, strong) NSString* bill_to_address_line2;
/**
	the Country where the transaction is being billed.
*/
@property(nonatomic, strong) NSString* bill_to_address_country;
/**
	the State/Province where the transaction is being billed (US and Canada only).
*/
@property(nonatomic, strong) NSString* bill_to_address_state;
/**
	the Postal Code where the transaction is being billed
*/
@property(nonatomic, strong) NSString* bill_to_address_postal_code;
/**
	the cardholder phone whose the transaction is being billed
*/
@property(nonatomic, strong) NSString* bill_to_phone;
/**
	the forename to whom the item sold is being shipped.
*/
@property(nonatomic, strong) NSString* ship_to_forename;
/**
	the surname to whom the item sold is being shipped.
*/
@property(nonatomic, strong) NSString* ship_to_surname;
/**
	the address city to where the item sold is being shipped.
*/
@property(nonatomic, strong) NSString* ship_to_address_city;
/**
	the first line of street address to where the item sold is being shipped.
*/
@property(nonatomic, strong) NSString* ship_to_address_line1;
/**
	the second line of street address to where the item sold is being shipped.
*/
@property(nonatomic, strong) NSString* ship_to_address_line2;
/**
	the country to where the item sold is being shipped.
*/
@property(nonatomic, strong) NSString* ship_to_address_country;
/**
	the state to where the item sold is being shipped. (US and Canada only
*/
@property(nonatomic, strong) NSString* ship_to_address_state;
/**
	the postal code to where the item sold is being shipped.
*/
@property(nonatomic, strong) NSString* ship_to_address_postal_code;
/**
	the phone number to whom the item sold is being shipped.
*/
@property(nonatomic, strong) NSString* ship_to_phone;
/**
	This field indicates the tenure of the installment payment.
*/
@property(nonatomic) int tenor_month;


@end
