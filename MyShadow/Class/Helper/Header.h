//
//  Header.h
//  ShadowNews
//
//  Created by lanou3g on 14-6-29.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#ifndef ShadowNews_Header_h
#define ShadowNews_Header_h

#define RELEASE_SAFELY(__point) do{[__point release],__point = nil;} while(0)


#define SCREENWIDTH 320
#define SCREENHEIGHT  [[UIScreen mainScreen] bounds].size.height


#endif
