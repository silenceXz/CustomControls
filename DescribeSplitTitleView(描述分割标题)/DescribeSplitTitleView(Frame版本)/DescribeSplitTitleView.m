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
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
    // set frame
    [self updateViewFrame];
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
    
    // 只有先设置了父视图的frame，才能对子控件进行布局
    if (!self.frame.size.width || !self.frame.size.height) {
        return;
    }
    
    CGFloat width  = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    // 先设置标题，根据标题的宽度动态计算分割线的宽度
    NSString *lableText = self.titleLB.text;
    
    NSDictionary *lableAttriDic = @{NSFontAttributeName:self.titleLB.font};
    
    // 为了计算一行的高度
    CGFloat oneRowHeight = [lableText sizeWithAttributes:lableAttriDic].height;
    CGSize labelSize = CGSizeMake(width,oneRowHeight);
    
    CGRect lableFrame = [lableText boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:lableAttriDic context:nil];
    
    CGFloat labelwidth = ceilf(lableFrame.size.width);
    
    // 分割线的宽度
    CGFloat segementLineWidth = (width -labelwidth - self.edgeMargin * 2 - self.titleMargin * 2) * 0.5;
    
    // 左侧分割线
    CGFloat lineY = (height - self.lineHeight) * 0.5;
    self.leftSegmentLine.frame = CGRectMake(self.edgeMargin, lineY, segementLineWidth, self.lineHeight);

    // 中间title
    CGFloat labelY = (height - oneRowHeight) * 0.5;
    self.titleLB.frame = CGRectMake(CGRectGetMaxX(self.leftSegmentLine.frame) + self.titleMargin, labelY, labelwidth, oneRowHeight);
    
    // 右侧分割线
    self.rightSegmentLine.frame = CGRectMake(CGRectGetMaxX(self.titleLB.frame) + self.titleMargin, lineY, segementLineWidth, self.lineHeight);
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
        
        [self updateViewFrame];
    }
}

- (void)setEdgeMargin:(CGFloat)edgeMargin{
    
    if (edgeMargin && (_edgeMargin != edgeMargin)) {
        _edgeMargin = edgeMargin;
        
        [self updateViewFrame];
    }
}

- (void)setTitleMargin:(CGFloat)titleMargin{
    
    if (titleMargin && (titleMargin != _titleMargin)) {
        _titleMargin = titleMargin;
        
        [self updateViewFrame];
    }
}

- (void)setTitleContent:(NSString *)titleContent{
    
    if (titleContent && (titleContent != _titleContent)) {
        _titleContent = titleContent;
        
        self.titleLB.text = _titleContent;
        [self updateViewFrame];
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
        [self updateViewFrame];
    }
}


@end
