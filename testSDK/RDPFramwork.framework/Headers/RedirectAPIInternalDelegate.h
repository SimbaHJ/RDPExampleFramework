//
//  RedirectAPIInternalDelegate.h
//  RDPSDK
//
//  Created by Ferico Samuel on 5/11/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#ifndef RedirectAPIInternalDelegate_h
#define RedirectAPIInternalDelegate_h

@protocol RedirectAPIInternalDelegate <NSObject>

- (void) onPaymentURLReceived:(NSString*) payment_url;
- (void) onRequestFailed;

@end


#endif /* RedirectAPIInternalDelegate_h */
