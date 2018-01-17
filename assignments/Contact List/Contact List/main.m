//
//  main.m
//  Contact List
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL runApp = YES;
        
        ContactList *contacts = [[ContactList alloc] init];

        while(runApp) {
            printf("\n");
            printf("new - Create a new contact\n");
            printf("list - List all contacts\n");
            printf("show - Show contact details\n");
            printf("quit - Exit Application\n");
            printf("\n");
            
            InputCollector *collector = [[InputCollector alloc] init];
            NSString *userInput = [collector inputForPrompt:@"What would you like do next? "];

            if ([userInput isEqual: @"quit"]) {
                break;
            } else if ([userInput isEqual: @"new"]) {
                NSString *fullName = [collector inputForPrompt:@"Enter full name: "];
                NSString *email = [collector inputForPrompt:@"Enter email: "];
                
                Contact *contactInfo = [[Contact alloc] initWithName:fullName email:email];
                [contacts addContact:contactInfo];
            } else if ([userInput isEqual: @"list"]) {
                [contacts listContacts];
            } else if ([userInput isEqual: @"show"]) {
                NSString *index = [collector inputForPrompt:@"Enter index number: "];
                [contacts showContact:[index intValue]];
            }

        }
    }

    return 0;
}
