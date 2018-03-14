//
//  RDPRedirectAPIWeb.h
//  RDPSDK
//
//  Created by Ferico Samuel on 5/13/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedirectAPIInternalDelegate.h"
#import "RDPRedirectAPI.h"
#import "RDPRedirectAPIPaymentType.h"
#import "RDPUIViewControllerExtension.h"
#import "RDPParameterExtractor.h"
#import "RDPHttpPostRequest.h"
#import "OriginViewType.h"
#define RDP_REDIRECT_API_QUERY_SERVICE_DEV_ENPOINT @"https://secure-dev.reddotpayment.com/service/Merchant_processor/query_redirection"
#define RDP_REDIRECT_API_QUERY_SERVICE_PRODUCTION_ENPOINT @"https://secure.reddotpayment.com/service/Merchant_processor/query_redirection"

/**
 	Class to represent a RDPRedirectAPIWebViewController
 */
@interface RDPRedirectAPIWebViewController : UIViewController<UIWebViewDelegate, RedirectAPIInternalDelegate, RDPWsDelegate>


/**
	The merchant id given by RDP when setting up an account.
*/
@property(nonatomic, strong) NSString* mid;
/**
	transactiontype enum that represent : 
	S : Sale Transaction
	A : (Pre) Authorisation
	I : Installment
*/
@property(nonatomic , strong)NSString *payment_type;
/**
	Merchant defined order-id for the transaction. Used for identifying the transaction request
*/
@property(nonatomic, strong) NSString* order_id;
/**
	In 3 digits ISO-4217 Alphabetical Currency Code format.
*/
@property(nonatomic, strong) NSString* ccy;
/**
	Transaction amount, the numbers only
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
	the email of customer.
*/
@property(nonatomic, strong) NSString* payer_email;
/**
	Any kind of extra information for merchant to relate with this transaction.
*/
@property(nonatomic, strong) NSString* merchant_reference;
/**
	languages that support
*/
@property(nonatomic, strong) NSString* locale;
/**
	Method that want to user avalaible 1 and 0	
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
	the state where the transaction is being billed.
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
	the address city to where the item sold is being shipped
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
	the state to where the item sold is being shipped. (US and Canada only)
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
	the key that given by RDP
*/
@property(nonatomic, strong) NSString* secret_key;
/**
	This field indicates the tenure of the installment payment.
*/
@property(nonatomic) int tenor_month;
/**
	the delegate variabel for RedirectAPIDelegate
*/
@property(nonatomic, strong) id<RedirectAPIDelegate> delegate;
/**
	represent RDPRedirectAPI
*/
@property(nonatomic, strong) RDPRedirectAPI* redirectAPIWrapper;
/**
	a web view to load url payment page 
*/
@property (strong, nonatomic) UIWebView *webView;
/**
	UIBarButtonItem that called and use to trigger click 
*/
@property (strong, nonatomic) UIBarButtonItem *btnNavDone;
/**
	The payment page URL where merchant's system need to redirect to
*/
@property(strong, nonatomic) NSString* payment_url;
@property(strong, nonatomic) NSString* payer_name;
@property(strong, nonatomic) NSString* card_no;
@property(strong, nonatomic) NSString* exp_date;
@property(strong, nonatomic) NSString* cvv2;
@property enum OriginViewType origin_type;

@end
