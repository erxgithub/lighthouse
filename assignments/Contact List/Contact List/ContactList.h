//
//  ContactList.h
//  Contact List
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property NSMutableArray *contactStore;

-(void)addContact:(Contact *)newContact;
-(void)listContacts;
-(void)showContact:(NSInteger)index;

@end
