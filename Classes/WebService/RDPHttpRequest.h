//
//  HttpRequest.h
//  RDP SDK
//
//  Created by Ferico Samuel on 5/1/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPWsResponse.h"

@protocol RDPWsDelegate <NSObject>

- (void) onSuccessWith:(RDPWsResponse*)responseObject;
- (void) onErrorWith: (NSString*) error andErrorCode: (NSString*) errorCode andRequest:(id) request;
- (void) onNoNetwork: (id) request;

@end

@interface RDPHttpRequest : NSObject

@property(nonatomic, strong) id<RDPWsDelegate> delegate;
@property(nonatomic) bool isUsingHeader;
@property(nonatomic, strong) NSMutableURLRequest* request;
@property(nonatomic, strong) RDPWsResponse* responseObject;
- (void) makeRequest: (bool)isUsingHeader;
- (id) initWithDelegate: (id<RDPWsDelegate>) delegate andURL:(NSURL*) url andResponseObject:(RDPWsResponse*) responseObject;
- (void) retry;

@end
