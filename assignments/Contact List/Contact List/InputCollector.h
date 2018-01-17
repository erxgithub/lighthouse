//
//  InputCollector.h
//  Contact List
//
//  Created by Eric Gregor on 2018-01-16.
//  Copyright © 2018 Eric Gregor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

-(NSString *)inputForPrompt:(NSString *)promptString;

@end
