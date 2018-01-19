//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "ManagerAnchovies.h"
#import "ManagerCheery.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Kitchen *kitchen = [Kitchen new];
//        ManagerAnchovies *managerAnchovies = [[ManagerAnchovies alloc] init];
//        ManagerCheery *managerCheery = [[ManagerCheery alloc] init];
        ManagerAnchovies *managerAnchovies = nil;
        ManagerCheery *managerCheery = nil;

        while (TRUE) {
            // Loop forever
            
            NSLog(@"Please pick your pizza size and toppings:");
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];

            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            // And then send some message to the kitchen...
            
            NSString *size = commandWords.firstObject;
            
            if ([size  isEqual: @"quit"]) {
                break;
            }
            
            NSArray *toppings = [commandWords subarrayWithRange: NSMakeRange( 1, [commandWords count] - 1)];
  
            NSLog(@"Please pick a manager:");
            NSLog(@"1: no manager, 2: no anchovies, 3: cheery");
            
            NSLog(@"> ");
            fgets (str, 100, stdin);
            
            NSString *managerString = [[NSString alloc] initWithUTF8String:str];

            managerString = [managerString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            int managerOption = [managerString intValue];
            NSString *managerDescription = @"";

            switch (managerOption) {
                case 2:
                    managerDescription = @"no anchovies";
 
                    if (managerAnchovies == nil) {
                        managerAnchovies = [[ManagerAnchovies alloc] init];
                    }

                    {kitchen.kitchenDelegate = managerAnchovies;}

                    break;
                    
                case 3:
                    managerDescription = @"cheery";
                    
                    if (managerCheery == nil) {
                        managerCheery = [[ManagerCheery alloc] init];
                    }
                    
                    {kitchen.kitchenDelegate = managerCheery;}
                    
                    break;

                default:
                    managerDescription = @"no manager";
                    {kitchen.kitchenDelegate = nil;}
                    
                    break;
            }

            NSLog(@"Manager selected is %@", managerDescription);

            Pizza *pizza = [kitchen makePizzaWithSize:size toppings:toppings];
            
            if (pizza == nil) {
                NSLog(@"No pizza for you!");
            } else {
                NSLog(@"Pizza order: size %@, toppings %@", [pizza orderSize], [pizza orderToppings]);
            }
        }
    }
    
    return 0;
}




