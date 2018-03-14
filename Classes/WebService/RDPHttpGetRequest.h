//
//  HttpGetRequest.h
//  RDP SDK
//
//  Created by Ferico Samuel on 5/1/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPHttpRequest.h"

@interface RDPHttpGetRequest : RDPHttpRequest

- (id) initUsingHeader:(bool)isUsingHeader withURL:(NSURL*) url andResponseObject:(RDPWsResponse*) responseObject andDelegate:(id) delegate;

@end
