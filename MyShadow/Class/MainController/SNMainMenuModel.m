//
//  SNMianMenuModel.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNMainMenuModel.h"
#import "SNMainMenu.h"

@implementation SNMainMenuModel

+ (NSDictionary *)mianMenuDic
{
    SNMainMenu * header = [SNMainMenu mainMenuTitle:@"头条" urlKeyStr:@"T1348647909107" url:@"http://c.3g.163.com/nc/article/headline/T1348647909107/0-20.html" pageKey:SNMainMenuHeaderPageKey];
    
    SNMainMenu * entertainment = [SNMainMenu mainMenuTitle:@"娱乐" urlKeyStr:@"T1348648517839" url:@"http://c.3g.163.com/nc/article/list/T1348648517839/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * sports = [SNMainMenu mainMenuTitle:@"体育" urlKeyStr:@"T1348649079062" url:@"http://c.3g.163.com/nc/article/list/T1348649079062/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * money = [SNMainMenu mainMenuTitle:@"财经" urlKeyStr:@"T1348648756099" url:@"http://c.3g.163.com/nc/article/list/T1348648756099/0-20.html" pageKey:SNMainMenuNormalPageKey];
    
     SNMainMenu * military = [SNMainMenu mainMenuTitle:@"军事" urlKeyStr:@"T1348648141035" url:@"http://c.3g.163.com/nc/article/list/T1348648141035/0-20.html" pageKey:SNMainMenuSimplePageKey];
    
//    SNMainMenu * sport = [SNMainMenu mainMenuTitle:@"体育" urlKeyStr:@"T1348649079062" url:@"http://c.3g.163.com/nc/article/list/T1348649079062/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * forum = [SNMainMenu mainMenuTitle:@"论坛" urlKeyStr:@"T1349837670307" url:@"http://c.3g.163.com/nc/article/list/T1349837670307/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * blogs = [SNMainMenu mainMenuTitle:@"博客" urlKeyStr:@"T1349837698345" url:@"http://c.3g.163.com/nc/article/list/T1349837698345/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * society = [SNMainMenu mainMenuTitle:@"社会" urlKeyStr:@"T1348648037603" url:@"http://c.3g.163.com/nc/article/list/T1348648037603/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * movie = [SNMainMenu mainMenuTitle:@"电影" urlKeyStr:@"T1348648650048" url:@"http://c.3g.163.com/nc/article/list/T1348648650048/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * car = [SNMainMenu mainMenuTitle:@"汽车" urlKeyStr:@"T1348654060988" url:@"http://c.3g.163.com/nc/article/list/T1348648756099/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * CSL = [SNMainMenu mainMenuTitle:@"中超" urlKeyStr:@"T1348649503389" url:@"http://c.3g.163.com/nc/article/list/T1348649503389/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * worldCup = [SNMainMenu mainMenuTitle:@"世界杯" urlKeyStr:@"T1399700447917" url:@"http://c.3g.163.com/nc/article/list/T1399700447917/0-20.html" pageKey:SNMainMenuNormalPageKey];
    
    SNMainMenu * lottery = [SNMainMenu mainMenuTitle:@"彩票" urlKeyStr:@"T1356600029035" url:@"http://c.3g.163.com/nc/article/list/T1356600029035/0-20.html" pageKey:SNMainMenuSimplePageKey];
    SNMainMenu * NBA = [SNMainMenu mainMenuTitle:@"NBA" urlKeyStr:@"T1348649145984" url:@"http://c.3g.163.com/nc/article/list/T1348649145984/0-20.html" pageKey:SNMainMenuSimplePageKey];
    SNMainMenu * football = [SNMainMenu mainMenuTitle:@"国际足球" urlKeyStr:@"T1348649176279" url:@"http://c.3g.163.com/nc/article/list/T1348649176279/0-20.html" pageKey:SNMainMenuSimplePageKey];
    
    SNMainMenu * CBA = [SNMainMenu mainMenuTitle:@"CBA" urlKeyStr:@"T1348649475931" url:@"http://c.3g.163.com/nc/article/list/T1348649475931/0-20.html" pageKey:SNMainMenuSimplePageKey];
    SNMainMenu * technology = [SNMainMenu mainMenuTitle:@"科技" urlKeyStr:@"T1348649580692" url:@"http://c.3g.163.com/nc/article/list/T1348649580692/0-20.html" pageKey:SNMainMenuSimplePageKey];
    SNMainMenu * phone = [SNMainMenu mainMenuTitle:@"手机" urlKeyStr:@"T1348649654285" url:@"http://c.3g.163.com/nc/article/list/T1348649654285/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * digital = [SNMainMenu mainMenuTitle:@"数码" urlKeyStr:@"T1348649776727" url:@"http://c.3g.163.com/nc/article/list/T1348649776727/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * mobileInternet = [SNMainMenu mainMenuTitle:@"移动互联" urlKeyStr:@"T1351233117091" url:@"http://c.3g.163.com/nc/article/list/T1351233117091/0-20.html" pageKey:SNMainMenuNormalPageKey];
    
    SNMainMenu * relaxed = [SNMainMenu mainMenuTitle:@"轻松一刻" urlKeyStr:@"T1350383429665" url:@"http://c.3g.163.com/nc/article/list/T1350383429665/0-20.html" pageKey:SNMainMenuNormalPageKey];
    
    SNMainMenu * original = [SNMainMenu mainMenuTitle:@"原创" urlKeyStr:@"T1367050859308" url:@"http://c.3g.163.com/nc/article/list/T1367050859308/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * selection = [SNMainMenu mainMenuTitle:@"精选" urlKeyStr:@"T1370583240249" url:@"http://c.3g.163.com/nc/article/list/T1370583240249/0-20.html" pageKey:SNMainMenuNormalPageKey];
    
    SNMainMenu * house  = [SNMainMenu mainMenuTitle:@"家居" urlKeyStr:@"T1348654105308" url:@"http://c.3g.163.com/nc/article/list/T1348654105308/0-20.html" pageKey:SNMainMenuNormalPageKey];
    SNMainMenu * game = [SNMainMenu mainMenuTitle:@"游戏" urlKeyStr:@"T1348654151579" url:@"http://c.3g.163.com/nc/article/list/T1348654151579/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * read = [SNMainMenu mainMenuTitle:@"读书" urlKeyStr:@"T1401272877187" url:@"http://c.3g.163.com/nc/article/list/T1401272877187/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * education = [SNMainMenu mainMenuTitle:@"教育" urlKeyStr:@"T1348654225495" url:@"http://c.3g.163.com/nc/article/list/T1348654225495/0-20.html" pageKey:SNMainMenuNormalPageKey];
    
     SNMainMenu * travel = [SNMainMenu mainMenuTitle:@"旅游" urlKeyStr:@"T1348654204705" url:@"http://c.3g.163.com/nc/article/list/T1348654204705/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * aroma = [SNMainMenu mainMenuTitle:@"酒香" urlKeyStr:@"T1385429690972" url:@"http://c.3g.163.com/nc/article/list/T1385429690972/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * blizzard  = [SNMainMenu mainMenuTitle:@"暴雪游戏" urlKeyStr:@"T1397016069906" url:@"http://c.3g.163.com/nc/article/list/T1397016069906/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * offspring = [SNMainMenu mainMenuTitle:@"亲子" urlKeyStr:@"T1397116135282" url:@"http://c.3g.163.com/nc/article/list/T1397116135282/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * wine = [SNMainMenu mainMenuTitle:@"葡萄酒" urlKeyStr:@"T1402031665628" url:@"http://c.3g.163.com/nc/article/list/T1402031665628/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * fashion = [SNMainMenu mainMenuTitle:@"时尚" urlKeyStr:@"T1348650593803" url:@"http://c.3g.163.com/nc/article/list/T1348650593803/0-20.html" pageKey:SNMainMenuNormalPageKey];
     SNMainMenu * emotion = [SNMainMenu mainMenuTitle:@"情感" urlKeyStr:@"T1348650839000" url:@"http://c.3g.163.com/nc/article/list/T1348650839000/0-20.html" pageKey:SNMainMenuSimplePageKey];
   
    
    SNMainMenu * local = [SNMainMenu mainMenuTitle:@"本地" urlKeyStr:@"local/5YyX5Lqs" url:@"http://c.3g.163.com/nc/article/local/5YyX5Lqs/0-20.html" pageKey:SNMainMenuLocalPageKey];
    
    SNMainMenu * ploymerization = [SNMainMenu mainMenuTitle:@"聚合阅读" urlKeyStr:@"nc/tag/v2/list" url:@"http://c.3g.163.com/nc/tag/v2/list/all.html HTTP/1.1" pageKey:SNMainMenuPolymerizationPageKey];
    
    SNMainMenu * recommend = [SNMainMenu mainMenuTitle:@"推荐" urlKeyStr:@"recommend" url:@"http://c.3g.163.com/recommend/getSubDocNews?passport=&devId=860271025372117&size=20" pageKey:SNMainMenuRecommendPageKey];
    
    
      NSDictionary * mianMenuDic =
    @{header.title:header,
      entertainment.title: entertainment,
      sports.title:sports,
      forum.title:forum,
      blogs.title:blogs,
      society.title:society,
      movie.title:movie,
      car.title:car,
      CSL.title:CSL,
      worldCup.title:worldCup,
      lottery.title:lottery,
      NBA.title:NBA,
      original.title:original,
      football.title:football,
      CBA.title:CBA,
      technology.title:technology,
      phone.title:phone,
      digital.title:digital,
      mobileInternet.title:mobileInternet,
      relaxed.title:relaxed,
      selection.title:selection,
      house.title:house,
      game.title:game,
      read.title:read,
      education.title:education,
      travel.title:travel,
      aroma.title:aroma,
      blizzard.title:blizzard,
      offspring.title:offspring,
      wine.title:wine,
      fashion.title:fashion,
      emotion.title:emotion,
      money.title:money,
      military.title:military,
      local.title:local,
      recommend.title:recommend,
      ploymerization.title:ploymerization
      };
    return mianMenuDic;
}


@end
