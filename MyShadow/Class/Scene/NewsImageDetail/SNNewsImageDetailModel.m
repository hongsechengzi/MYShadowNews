//
//  SNNewsImageDetailModel.m
//  MyShadow
//
//  Created by lanou3g on 14-7-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNNewsImageDetailModel.h"
#import "AFNetworking.h"
#import "SNNewsImageDetail.h"

@implementation SNNewsImageDetailModel


+ (void) imageDetailModelWithPhotosetID:(NSString *)photosetID
                                success: (SNNewsModelSuccessBlock) success
                                   fail: (SNNewsModelFailBlock) fail
{
    NSLog(@"photosetID %@",photosetID);
    NSString * photoStr = [photosetID substringWithRange:NSMakeRange(photosetID.length-10, 10)];
    NSArray * photoArr = [photoStr componentsSeparatedByString:@"|"];
    
    NSString * urlStr = [NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/%@/%@.json",photoArr[0],photoArr[1]];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
     manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * photos= [responseObject objectForKey:@"photos"];
        
        NSString * setName = [responseObject objectForKey:@"setname"];
        
        success([SNNewsImageDetail imageDetailWithPhotos:photos setName:setName]);
    
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];


}
@end
