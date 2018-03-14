//
//  ConnectAPIDelegate.h
//  RDP SDK
//
//  Created by Ferico Samuel on 5/1/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#ifndef ConnectAPIDelegate_h
#define ConnectAPIDelegate_h

@protocol ConnectAPIDelegate <NSObject>

- (void) onRequestFailedWithErrorCode:(int) errorCode andDescription:(NSString*) description;
- (void) onRequestRejectedWithParams:(NSDictionary*) params andErrorCode:(int) errorCode;
- (void) onRequestFinishedWithParams:(NSDictionary*) params;

@optional
- (void) paymentInterfaceWillRequest;
- (void) paymentInterfaceDidRequest;
- (void) returnUrlWillLoad;
- (void) returnUrlDidLoad;
- (void) transactionSignatureWillValidate;
- (void) transactionSignatureDidValidateWithParam: (NSDictionary*) params;
- (BOOL) shouldDismissConsentScreen;
- (void) consentScreenDidDissapear;
@end

#endif /* ConnectAPIDelegate_h */
