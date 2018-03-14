//
//  HttpRequest.m
//  RDP SDK
//
//  Created by Ferico Samuel on 5/1/17.
//  Copyright © 2017 d'Amigos. All rights reserved.
//

#import "RDPHttpRequest.h"

@implementation RDPHttpRequest

- (id) initWithDelegate: (id) delegate andURL:(NSURL*) url andResponseObject:(RDPWsResponse*) responseObject {
    self.delegate = delegate;
    self.request = [[NSMutableURLRequest alloc]initWithURL:url];
    self.responseObject = responseObject;
    return self;
}

- (void) makeRequest: (bool)isUsingHeader {
    self.isUsingHeader = isUsingHeader;
    NSURLSession* session = [NSURLSession sharedSession];
    [self.request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    if(isUsingHeader) {
        //TODO generate header
        //NSString* bearer = Util
    }
    //TODO check internet connection
    //NSURLSessionDataTask* task = [session dataTaskWithRequest:request];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:self.request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        NSHTTPURLResponse* httpUrlResponse = (NSHTTPURLResponse*)response;
        if(httpUrlResponse.statusCode >= 200 && httpUrlResponse.statusCode < 300) {
            [self.responseObject parse:data];
            if([self.responseObject isSuccess]) {
                [self.delegate onSuccessWith:self.responseObject];
                return;
            }
            [self.delegate onErrorWith:self.responseObject.response_msg andErrorCode:self.responseObject.response_code andRequest:self];
        }
        else {
            [self.responseObject parse:data];
            if(self.responseObject) {
                [self.delegate onErrorWith:self.responseObject.response_msg andErrorCode:self.responseObject.response_code andRequest:self];
                return;
            }
            [self.delegate onNoNetwork:self];
        }
    }];
    [task resume];
}

- (void) retry {
    NSLog(@"%@", self.request.URL.absoluteString);
    //NSData* data = request.HTTPBody;
    [self makeRequest:self.isUsingHeader];
    
}

@end
