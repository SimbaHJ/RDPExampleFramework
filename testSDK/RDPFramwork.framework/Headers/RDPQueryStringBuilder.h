//
//  QueryStringBuilder.h
//  RDP SDK
//
//  Created by Ferico Samuel on 5/1/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDPQueryStringBuilder : NSObject

+ (NSString*) constructQueryString:(NSDictionary*) params;

@end
