//
//  SNCollectionHeadView.m
//  ShadowNews
//
//  Created by lanou3g on 14-7-2.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "SNCollectionHeadView.h"

@implementation SNCollectionHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupSubviews];
    }
    return self;
}
- (void)setupSubviews
{
    self.oneLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)] autorelease];
    self.oneLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:self.oneLabel];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
