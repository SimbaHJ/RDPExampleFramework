//
//  StringResponse.h
//  RDP SDK
//
//  Created by Ferico Samuel on 5/3/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPWsResponse.h"

@interface RDPStringResponse : RDPWsResponse

@property(nonatomic, strong) NSString* body;

@end
