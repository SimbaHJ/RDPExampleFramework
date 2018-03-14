//
//  RDPRedirectAPIScanCardViewController.m
//  RDPSDK
//
//  Created by Ferico Samuel on 8/16/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import "RDPRedirectAPIScanCardViewController.h"
#import "CardIO.h"
#import "RDPRedirectAPIPaymentType.h"
#import "RDPUIViewControllerExtension.h"

@interface RDPRedirectAPIScanCardViewController ()<CardIOPaymentViewControllerDelegate>

@end

@implementation RDPRedirectAPIScanCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    [RDPUIViewControllerExtension showViewControllerPresentWithDispatch:self withviewController:scanViewController];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController{
    NSLog(@"User cancelled scan");
    [RDPUIViewControllerExtension dismissPopUpUsingDispatch:self completion:^{
        [RDPUIViewControllerExtension dismissPopUpUsingDispatch:self completion:nil];
    }];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)cardInfo inPaymentViewController:(CardIOPaymentViewController *)paymentViewController{
    NSLog(@"Scan succeeded with info: %@", cardInfo);
    [RDPUIViewControllerExtension dismissPopUpUsingDispatch:self completion:nil];
    RDPRedirectAPIWebViewController *vc = [RDPRedirectAPIWebViewController alloc];
    vc.delegate = self.delegate;
    vc.mid = self.mid;
    vc.order_id = self.order_id;
    vc.amount = self.amount;
    vc.ccy = self.ccy;
    vc.payer_name = self.payer_name;
    vc.payer_email = self.payer_email;
    vc.payment_type = self.payment_type;
    vc.secret_key = self.secret_key;
    vc.redirect_url = self.redirect_url;
    vc.back_url = self.back_url;
    vc.notify_url = self.notify_url;
    vc.merchant_reference = self.merchant_reference;
    vc.locale = self.locale;
    vc.multiple_method_page = self.multiple_method_page;
    vc.bill_to_forename = self.bill_to_forename;
    vc.bill_to_surname = self.bill_to_surname;
    vc.bill_to_address_city = self.bill_to_address_city;
    vc.bill_to_address_line1 = self.bill_to_address_line1;
    vc.bill_to_address_line2 = self.bill_to_address_line2;
    vc.bill_to_address_country = self.bill_to_address_country;
    vc.bill_to_address_state = self.bill_to_address_state;
    vc.bill_to_phone = self.bill_to_phone;
    vc.ship_to_forename = self.ship_to_forename;
    vc.ship_to_surname = self.ship_to_surname;
    vc.ship_to_address_city = self.ship_to_address_city;
    vc.ship_to_address_city = self.ship_to_address_city;
    vc.ship_to_address_line1 = self.ship_to_address_line1;
    vc.ship_to_address_line2 = self.ship_to_address_line2;
    vc.ship_to_address_state = self.ship_to_address_state;
    vc.ship_to_address_state = self.ship_to_address_state;
    vc.ship_to_address_postal_code = self.ship_to_address_postal_code;
    vc.ship_to_phone = self.ship_to_phone;
    vc.tenor_month = self.tenor_month;
    vc.payer_name = self.payer_name;
    NSString *year = [[NSString stringWithFormat:@"%-4lu",(unsigned long)cardInfo.expiryYear] substringFromIndex:0];
    vc.exp_date = [NSString stringWithFormat:@"%02lu%@",(unsigned long)cardInfo.expiryMonth, year];
    vc.cvv2 = cardInfo.cvv;
    vc.card_no = cardInfo.cardNumber;
    vc.origin_type = RDPScanCard;
    [RDPUIViewControllerExtension showViewControllerPresentWithDispatch:self withviewController:vc];
    
}

@end
