//
//  SSLTestDemoTests.m
//  SSLTestDemoTests
//
//  Created by Alexander v. Below on 12.03.13.
//  Copyright (c) 2013 Alexander v. Below. All rights reserved.
//

#import "SSLTestDemoTests.h"

@implementation SSLTestDemoTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSynchronousSSLDownload
{
    NSHTTPURLResponse *resp;
    NSError *error;
    NSData * data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://daw.apple.com"]]
                                   returningResponse:&resp
                                               error:&error];
    STAssertNotNil(data, @"Data should not be nil");
    NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", content);
    STAssertNil(error, @"Error should be nil, but is: %@", [error description]);
    STAssertNotNil(resp, @"There must be a response");
    STAssertEquals([resp statusCode], 200, @"Status code should be 200 OK, but is %d", [resp statusCode]);
}

@end
