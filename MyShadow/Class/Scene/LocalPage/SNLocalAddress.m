//
//  SNLocalAddress.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-1.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNLocalAddress.h"

@interface SNLocalAddress ()

@property(nonatomic,retain)CLLocationManager * locManager;

@end

@implementation SNLocalAddress
- (void)dealloc
{
    [_locManager stopUpdatingLocation];
    RELEASE_SAFELY(_cityDic);
    [super dealloc];

}
- (instancetype)initWithBlock:(CityInfoBlock)cityInfoBlock
{
    self = [super init];
    if (self) {
          self.cityInfoBlock = cityInfoBlock;
            self.locManager = [[[CLLocationManager alloc] init] autorelease];
            self.locManager.delegate = self;
            self.locManager.desiredAccuracy = kCLLocationAccuracyBest;
            self.locManager.distanceFilter = 1000;
            [self.locManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLGeocoder * geocoder=[[[CLGeocoder alloc]init]autorelease];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemark,NSError *error)
     {
         if (placemark.count > 0) {
             
             CLPlacemark * mark =[placemark objectAtIndex:0];
//             NSString *myCity = mark.locality;
//             NSLog(@"-----%@",mark.addressDictionary);
//             NSLog(@"%@",[mark.addressDictionary objectForKey:@"State"]);
//             NSLog(@"%@",myCity);
             
             self.cityDic = mark.addressDictionary;
             
             self.cityInfoBlock(self.cityDic);
        
         }else if (error == nil && placemark.count == 0){
         
         NSLog(@"No results were returned.");
         }else if (error != nil){
          NSLog(@"An error occurred = %@", error);
         }
       }];


}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorMsg = nil;
    if ([error code] == kCLErrorDenied) {
        errorMsg = @"访问被拒绝";
    }
    if ([error code] == kCLErrorLocationUnknown) {
        errorMsg = @"获取位置信息失败";
    }
    
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"Location" message:errorMsg delegate:self cancelButtonTitle:@"Ok"otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
}


//- (NSString *)gettingLocalCity
//{
//      NSLog(@" self.dic %@",self.dic);
//    return [self.dic objectForKey:@"City"];
//}
//- (NSString *)gettingLocalProvincial
//{
//    return [self.dic objectForKey:@"State"];
//}
//
@end
