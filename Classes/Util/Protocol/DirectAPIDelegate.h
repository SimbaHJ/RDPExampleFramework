//
//  DirectAPIDelegate.h
//  RDPSDK
//
//  Created by Ricky Putra Harlim on 5/17/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#ifndef DirectAPIDelegate_h
#define DirectAPIDelegate_h
#import "RDPDirectAPIResponse.h"
@protocol DirectAPIDelegate <NSObject>

- (void) onRequestFailedWithErrorCode:(int) errorCode andDescription:(NSString*) description;
- (void) onRequestFinishedWithResponseObject:(RDPDirectAPIResponse*) response;

@optional
- (void) paymentInterfaceWillRequest;
- (void) paymentInterfaceDidRequest;
- (void) transactionSignatureWillValidate;
- (void) transactionSignatureDidValidateWithParam: (NSDictionary*) params;
@end

#endif /* DirectAPIDelegate_h */
