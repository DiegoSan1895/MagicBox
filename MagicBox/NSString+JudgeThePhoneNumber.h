//
//  NSString+JudgeThePhoneNumber.h
//  MagicBox
//
//  Created by DiegoSan on 3/15/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JudgeThePhoneNumber)

+ (BOOL)isMobileNumber:(NSString *)mobileNum;
@end
