//
//  RDPScanCardViewController.h
//  RDPSDK
//
//  Created by Ricky Putra Harlim on 5/11/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDPConnectAPI.h"
#import "ConnectAPITransactionType.h"
#import "RDPConnectAPIWebViewController.h"

@interface RDPScanCardViewController : UIViewController <ConnectAPIDelegate>
@property (strong, nonatomic) id<ConnectAPIDelegate> delegate;
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
