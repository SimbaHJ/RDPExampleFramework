//
//  HttpPostRequest.h
//  RDP SDK
//
//  Created by Ferico Samuel on 5/1/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPHttpRequest.h"

@interface RDPHttpPostRequest : RDPHttpRequest

- (id) initUsingHeader:(bool) isUsingHeader andURL:(NSURL*) url andDataString:(NSString*) data andResponseObject:(RDPWsResponse*) responseObject andDelegate:(id) delegate;
- (id) initUsingHeader:(bool) isUsingHeader andURL:(NSURL*) url andData:(NSData*) data andResponseObject:(RDPWsResponse*) responseObject andDelegate:(id) delegate;
- (id) initUsingHeader:(bool) isUsingHeader andURL:(NSURL*) url andResponseObject:(RDPWsResponse*) responseObject andDelegate:(id) delegate;

@end
