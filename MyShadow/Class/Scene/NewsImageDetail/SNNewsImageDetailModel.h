//
//  SNNewsImageDetailModel.h
//  MyShadow
//
//  Created by lanou3g on 14-7-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SNNewsModelSuccessBlock)(id responseObject);
typedef void(^SNNewsModelFailBlock)(NSError * error);
@interface SNNewsImageDetailModel : NSObject

+ (void) imageDetailModelWithPhotosetID:(NSString *)photosetID
                                success: (SNNewsModelSuccessBlock) success
                                   fail: (SNNewsModelFailBlock) fail;

@end
