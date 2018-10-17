//
//  DescribeSplitTitleView.m
//  自定义组件view
//
//  Created by silence on 2018/10/17.
//  Copyright © 2018年 silence. All rights reserved.
//


#import "DescribeSplitTitleView.h"

@interface DescribeSplitTitleView()

/**
 左侧分割线
 */
@property(strong,nonatomic)UIView  *leftSegmentLine;

/**
 右侧分割线
 */
@property(strong,nonatomic)UIView  *rightSegmentLine;

/**
 标题，默认字号14，颜色灰色RGBA(185, 193, 199, 1)
 */
@property(strong,nonatomic)UILabel  *titleLB;

@end


@implementation DescribeSplitTitleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setup];
        [self updateViewFrame];

    }
    return self;
}

/**
 进行初始化设置
 */
- (void)setup{
    
    // 分割线与屏幕的间距
    self.edgeMargin = 30.0;
    
    // 分割线与标题的间距
    self.titleMargin = 20.0f;
    
    // 分割线的颜色
    self.lineColor = [UIColor colorWithRed:(185/255.0) green:(193/255.0) blue:(193/255.0) alpha:1];
    
    // 分割线的高度
    self.lineHeight = 1.0;
    
    // 左侧分割线
    UIView *leftSegmentLine = [[UIView alloc]init];
    leftSegmentLine.backgroundColor = self.lineColor;
    [self addSubview:leftSegmentLine];
    self.leftSegmentLine = leftSegmentLine;
    
    // 标题
    UILabel *titleLB = [[UILabel alloc]init];
    titleLB.text = @"这是分割线标题";
    titleLB.font = [UIFont systemFontOfSize:14];
    titleLB.textColor = self.lineColor;
    [self addSubview:titleLB];
    self.titleLB = titleLB;
    
    // 右侧分割线
    UIView *rightSegmentLine = [[UIView alloc]init];
    rightSegmentLine.backgroundColor = self.lineColor;
    [self addSubview:rightSegmentLine];
    self.rightSegmentLine = rightSegmentLine;
}

- (void)updateViewFrame{
    
    CGFloat width  = self.frame.size.width;
    
    // 先设置标题，根据标题的宽度动态计算分割线的宽度
    NSString *lableText = self.titleLB.text;
    
    NSDictionary *lableAttriDic = @{NSFontAttributeName:self.titleLB.font};
    
    // 为了计算一行的高度
    CGFloat oneRowHeight = [lableText sizeWithAttributes:lableAttriDic].height;
    CGSize labelSize = CGSizeMake(width,oneRowHeight);
    
    CGRect lableFrame = [lableText boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:lableAttriDic context:nil];
    
    CGFloat labelwidth = ceilf(lableFrame.size.width);
    
    WeakSelf
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf);
        make.height.mas_equalTo(oneRowHeight);
        make.width.mas_equalTo(labelwidth);
    }];
    
    [self.leftSegmentLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(weakSelf.edgeMargin);
        make.centerY.equalTo(weakSelf);
        make.height.mas_equalTo(weakSelf.lineHeight);
        make.right.equalTo(weakSelf.titleLB.mas_left).offset(-weakSelf.titleMargin);
    }];
    
    [self.rightSegmentLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-weakSelf.edgeMargin);
        make.centerY.equalTo(weakSelf);
        make.height.mas_equalTo(weakSelf.lineHeight);
        make.left.equalTo(weakSelf.titleLB.mas_right).offset(weakSelf.titleMargin);
    }];
}


- (void)setLineColor:(UIColor *)lineColor{
    
    if (lineColor && (lineColor != _lineColor)) {
        _lineColor = lineColor;
        
        self.leftSegmentLine.backgroundColor = lineColor;
        self.rightSegmentLine.backgroundColor = lineColor;
    }
}

- (void)setLineHeight:(CGFloat)lineHeight{
    
    if (lineHeight && (lineHeight != _lineHeight)) {
        _lineHeight = lineHeight;
        
        [self.leftSegmentLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(lineHeight);
        }];
        
        [self.rightSegmentLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(lineHeight);
        }];
    }
}

- (void)setEdgeMargin:(CGFloat)edgeMargin{
    
    if (edgeMargin && (_edgeMargin != edgeMargin)) {
        _edgeMargin = edgeMargin;
        
        WeakSelf
        [self.leftSegmentLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).offset(weakSelf.edgeMargin);
        }];
        
        [self.rightSegmentLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf).offset(-weakSelf.edgeMargin);
        }];
    }
}

- (void)setTitleMargin:(CGFloat)titleMargin{
    
    if (titleMargin && (titleMargin != _titleMargin)) {
        _titleMargin = titleMargin;
        
        WeakSelf
        [self.leftSegmentLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.titleLB.mas_left).offset(-weakSelf.titleMargin);
        }];
        
        [self.rightSegmentLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.titleLB.mas_right).offset(weakSelf.titleMargin);
        }];
    }
}

- (void)setTitleContent:(NSString *)titleContent{
    
    if (titleContent && (titleContent != _titleContent)) {
        _titleContent = titleContent;
        
        self.titleLB.text = _titleContent;
        
        CGFloat width  = self.frame.size.width;
        
        // 先设置标题，根据标题的宽度动态计算分割线的宽度
        NSString *lableText = self.titleLB.text;
        
        NSDictionary *lableAttriDic = @{NSFontAttributeName:self.titleLB.font};
        
        // 为了计算一行的高度
        CGFloat oneRowHeight = [lableText sizeWithAttributes:lableAttriDic].height;
        CGSize labelSize = CGSizeMake(width,oneRowHeight);
        
        CGRect lableFrame = [lableText boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:lableAttriDic context:nil];
        
        CGFloat labelwidth = ceilf(lableFrame.size.width);
        
        [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(labelwidth);
        }];
    }
}

- (void)setTextColor:(UIColor *)textColor{
    
    if (textColor && (textColor != _textColor)) {
        _textColor = textColor;
        
        self.titleLB.textColor = textColor;
    }
}

- (void)setTitleFont:(UIFont *)titleFont{
    
    if (titleFont && (titleFont != _titleFont)) {
        _titleFont = titleFont;
        
        self.titleLB.font = titleFont;
        
        NSString *lableText = self.titleLB.text;
        NSDictionary *lableAttriDic = @{NSFontAttributeName:self.titleLB.font};
        CGFloat oneRowHeight = [lableText sizeWithAttributes:lableAttriDic].height;

        [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(oneRowHeight);
        }];
    }
}

@end
