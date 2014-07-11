//
//  SNLocalAddress.h
//  ShadowNews
//
//  Created by lanou3g on 14-7-1.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^CityInfoBlock)(NSDictionary * cityDic);

@interface SNLocalAddress : NSObject<CLLocationManagerDelegate>

@property(nonatomic,retain)NSDictionary * cityDic;//!<存储城市信息的字典
@property(nonatomic,copy)CityInfoBlock cityInfoBlock;//!< block

///**
// *  定位到当地的省份
// *
// *  @return 定位到的省份名
// */
//- (NSString *)gettingLocalProvincial;
///**
// *  定位到当地的城市
// *
// *  @return 定位到的城市名
// */
//- (NSString *)gettingLocalCity;

/**
 *  传值cityDic key值City城市  key值State省份
 *
 *  @param cityInfoBlock 00
 *
 *  @return 00
 */
- (instancetype)initWithBlock:(CityInfoBlock)cityInfoBlock;

@end
