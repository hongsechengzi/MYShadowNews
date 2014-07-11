//
//  SNNewsDetailView.m
//  ShadowNews
//
//  Created by 颜风 on 14-7-7.
//  Copyright (c) 2014年 ShadowNews. All rights reserved.
//

#import "SNNewsDetailView.h"
#import "SNNewsDetail.h"

@interface SNNewsDetailView ()
@property (retain, nonatomic) SNNewsDetail * SNNDDetail; //!< 新闻详情.
@property (retain, nonatomic) UIWebView * SNNDWebView; //!< 用于显示新闻主体信息.
@end
@implementation SNNewsDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    if (nil == self.window) {
        [self SNNDSetUpSubviews];
    }
}

- (void)reloadData
{
    // 重置和数据相关的属性.
    self.SNNDDetail = nil;
    //[self.SNNDWebView loadHTMLString: self.SNNDDetail.body baseURL:nil];
   // NSLog(@"self.SNNDDetail.body = %@",self.SNNDDetail.body);
    if (self.SNNDDetail.imgArray.count == 0 && self.SNNDDetail.videoArray.count == 0) {
        [self.SNNDWebView loadHTMLString: self.SNNDDetail.body baseURL:[NSURL URLWithString:@"http://c.m.163.com"]];
    }else{
          NSMutableString * string = [NSMutableString stringWithString: self.SNNDDetail.body];
        NSLog(@"---------%@",string);
        if (self.SNNDDetail.imgArray.count > 0) {
          
            [self.SNNDDetail.imgArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
                
                NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"<!--IMG#%@-->", [NSNumber numberWithUnsignedInteger: idx]] options:NSRegularExpressionCaseInsensitive error:nil];
                NSString * src = [self.SNNDDetail.imgArray[idx] objectForKey:@"src"];
                NSArray * sizeArray = [[self.SNNDDetail.imgArray[idx] objectForKey:@"pixel"] componentsSeparatedByString:@"*"];
                CGFloat  width = 300;
                CGFloat height = 300 *([sizeArray[1] floatValue]/3)/([sizeArray[0] floatValue]/3);
                
                [regex replaceMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:[NSString stringWithFormat:@"<img src= %@ width = %f height = %f/>",src,width,height]];
            }];
        
        }
        if (self.SNNDDetail.videoArray.count > 0) {
            [self.SNNDDetail.videoArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
                
                NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"<!--VIDEO#%@-->", [NSNumber numberWithUnsignedInteger: idx]] options:NSRegularExpressionCaseInsensitive error:nil];
                
                [regex replaceMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:[NSString stringWithFormat:@"<embed src= %@ width = 300 height = 150 volume = 200 autostart = true webkit-playsinline/embed>",[self.SNNDDetail.videoArray[idx] objectForKey:@"url_mp4"]]];              
            }];
        }
          self.SNNDWebView.allowsInlineMediaPlayback = YES;
        [self.SNNDWebView loadHTMLString: string baseURL:[NSURL URLWithString:@"http://c.m.163.com"]];
        NSLog(@" string = %@",string);
    }
    
    
    
}

- (SNNewsDetail *)SNNDDetail
{
    if (nil == _SNNDDetail) {
        self.SNNDDetail = [self.dataSource detailInNewsDetailView: self];
    }
    
    return _SNNDDetail;
}

/**
 *  设置子视图.
 */
- (void) SNNDSetUpSubviews
{
    UIWebView * webView = [[UIWebView alloc] init];
    webView.scrollView.bounces = NO;
    [webView setTranslatesAutoresizingMaskIntoConstraints: NO];
    self.SNNDWebView = webView;
    SNRelease(webView);
    [self addSubview: self.SNNDWebView];
    
    // 设置视图约束,布局视图.
    NSMutableArray * constraintsArray = [NSMutableArray arrayWithCapacity: 42];
    
    [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat: @"|[webView]|" options:0 metrics:nil views: NSDictionaryOfVariableBindings(webView)]];
    [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat: @"V:|-64-[webView]|" options:0 metrics:nil views: NSDictionaryOfVariableBindings(webView)]];
    [self addConstraints: constraintsArray];
    
    // 初始化视图内容.
    [self reloadData];
}
@end
