//
//  RDPConnectAPIWebViewController.h
//  Pods
//
//  Created by Ricky Putra Harlim on 5/24/17.
//
//


#import <UIKit/UIKit.h>
#import "RDPConnectAPI.h"
#import "RDPSignatureUtil.h"
#import "RDPUIViewControllerExtension.h"
#import "RDPParameterExtractor.h"
#import "OriginViewType.h"

@interface RDPConnectAPIWebViewController : UIViewController<UIWebViewDelegate, ConnectAPIInternalDelegate>

@property(nonatomic, strong) RDPConnectAPI* connectAPIWrapper;
@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) UIBarButtonItem *btnNavDone;
@property (strong, nonatomic) id<ConnectAPIDelegate> delegate;


@property enum OriginViewType origin_type;
@property (copy, nonatomic) NSString* secret_key;
@property (copy, nonatomic) NSString* order_number;
@property (copy, nonatomic) NSString* merchant_id;
@property (copy, nonatomic) NSString* key;
@property float amount;
@property (copy, nonatomic) NSString* currency_code;
@property (copy, nonatomic) NSString* email;
@property enum ConnectAPITransactionType transaction_type;
@property (copy, nonatomic) NSString* return_url;
@property (copy, nonatomic) NSString* card_number;
@property (copy, nonatomic) NSString* expiry_date;
@property (copy, nonatomic) NSString* cvv2;
@end
