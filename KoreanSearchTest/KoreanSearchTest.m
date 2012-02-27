//
//  KoreanSearchTest.m
//  KoreanSearchTest
//
//  Created by taehoon koo on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KoreanSearchTest.h"
#import "ABContactsHelper.h"

@interface KoreanSearchTest()
@property (nonatomic, retain) ABContact *contact;
@end

@implementation KoreanSearchTest
@synthesize contact = mContact;
- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    ABContact *contact = [ABContact contact];
    contact.firstname = @"긱보드";
    
    [ABContactsHelper addContact:contact withError:NULL];
    self.contact = contact;
}

- (void)tearDown
{
    // Tear-down code here.
    [self.contact removeSelfFromAddressBook:NULL];
    self.contact = nil;
    [super tearDown];
}

- (void)testExample
{
    NSArray *contacts = [ABContactsHelper contactsMatchingName:@"긱보드"];
    STAssertTrue([contacts count] > 0, @"");
    
    contacts = [ABContactsHelper contactsMatchingName:@"ㄱㅂㄷ"];
    STAssertTrue([contacts count] > 0, @"");
    
    contacts = [ABContactsHelper contactsMatchingName:@"긱ㅂㄷ"];
    STAssertTrue([contacts count] > 0, @"");
}
@end
