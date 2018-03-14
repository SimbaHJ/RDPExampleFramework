//
//  RedirectAPIDelegate.h
//  RDPSDK
//
//  Created by Ferico Samuel on 5/11/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#ifndef RedirectAPIDelegate_h
#define RedirectAPIDelegate_h
#import "RDPRedirectAPIResponse.h"
#import "RDPRedirectAPIRedirectionResponse.h"

@protocol RedirectAPIDelegate <NSObject>

- (void) paymentURLDidReceivedWithURL:(NSString*) url andResponse:(RDPRedirectAPIResponse*) response;
- (void) onRequestFailedWithErrorCode:(int) errorCode andDescription:(NSString*) description;
- (void) onRequestFinishedWithResponseObject:(RDPRedirectAPIResponse*) response;

@optional
- (void) paymentInterfaceWillRequest;
- (void) paymentInterfaceDidRequest;
- (void) paymentUrlWillLoad;
- (void) paymentUrlDidLoad;
- (void) redirectionResultWillRequest;
- (void) redirectionResultDidRequest;
- (void) redirectUrlWillLoad;
- (void) redirectUrlDidLoad;
- (void) btnBackDidTap;
- (BOOL) shouldDismissConsentScreen;
- (void) consentScreenDidDissapear;
@end

#endif /* RedirectAPIDelegate_h */
