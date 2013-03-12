//
//  SSLTestDemoTests.m
//  SSLTestDemoTests
//
//  Created by Alexander v. Below on 12.03.13.
//  To the extent possible under law, Alexander von Below has waived all
//  copyright and related or neighboring rights to SSLTestDemo.
//  This work is published from: Germany.
//

#import "SSLTestDemoTests.h"

// Tests for Continuous Integration are setup like this:
// http://www.raingrove.com/2012/03/28/running-ocunit-and-specta-tests-from-command-line.html

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
