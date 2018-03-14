//
//  MD5Calculator.h
//  RDPSDK
//
//  Created by Ferico Samuel on 5/3/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDPMD5Calculator : NSObject

+ (NSString*) calculateFrom:(NSString*)input;

@end
