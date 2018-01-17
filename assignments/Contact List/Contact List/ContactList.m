//
//  ContactList.m
//  Contact List
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contactStore = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addContact:(Contact *)newContact {
    [self.contactStore addObject:newContact];
}

-(void)listContacts {
    NSInteger index = 0;
    
    printf("\n");
    
    for (Contact *contactInfo in self.contactStore) {
        printf("%ld: %s\n", (long)index, [contactInfo.fullName UTF8String]);
        index++;
    }
}

-(void)showContact:(NSInteger)index {
    @try {
        Contact *contactInfo = [self.contactStore objectAtIndex:index];
        
        printf("\n");
        printf("Index: %ld\n", (long)index);
        printf("Full Name:: %s\n", [contactInfo.fullName UTF8String]);
        printf("Email:: %s\n", [contactInfo.email UTF8String]);
    }
    @catch (NSException * e) {
        printf("\n");
        printf("Not found\n");
    }
}

@end
