//
//  SNMainMenu.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNMainMenu : NSObject
@property(nonatomic,retain,readonly)NSString * title;
@property(nonatomic,retain,readonly)NSString * urlKeyStr;
@property(nonatomic,retain,readonly)NSString * url;
@property(nonatomic,retain,readonly)NSString * pageKey;

- (instancetype)initWithTitle:(NSString *)title urlKeyStr:(NSString *)urlkeyStr url:(NSString *)url pageKey:(NSString *)pageKey;

+ (instancetype)mainMenuTitle:(NSString *)title urlKeyStr:(NSString *)urlkeyStr url:(NSString *)url pageKey:(NSString *)pageKey;



@end
