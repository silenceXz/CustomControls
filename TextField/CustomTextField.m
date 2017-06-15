//
//  CustomTextField.m
//
//  Created by Apple on 17/5/4.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField


// 手写代码时，会调用
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

// xib时，会调用
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

/**
 初始化

 @param frame      位置大小
 @param marginLeft 距离左边间距
 @return           占位符的颜色
 */
- (instancetype)initWithFrame:(CGRect)frame marginLeft:(CGFloat)marginLeft{
    
    if (self = [super initWithFrame:frame]) {
        
        self.marginLeft = marginLeft;
        
        [self setup];
    }
    return self;
}


/**
 初始化

 @param frame          位置大小
 @param marginLeft     距离左边间距
 @param placeholderStr 占位符
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame marginLeft:(CGFloat)marginLeft placeholderStr:(NSString *)placeholderStr{
    
    if (self = [super initWithFrame:frame]) {
        
        self.marginLeft = marginLeft;
        self.placeholder = placeholderStr;
        [self setup];
    }
    return self;
}


/**
 初始化

 @param frame              位置大小
 @param marginLeft         距离左边间距
 @param placeholderStr     占位符
 @param placeholderColor   占位符的颜色
 @param placeholderFont    占位符的字体
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame marginLeft:(CGFloat)marginLeft placeholderStr:(NSString *)placeholderStr placeholderColor:(UIColor *)placeholderColor placeholderFont:(UIFont *)placeholderFont{
    
    if (self = [super initWithFrame:frame]) {
        
        self.marginLeft = marginLeft;
        self.placeholder = placeholderStr;
        self.placeholderColor = placeholderColor;
        self.placeholderFont = placeholderFont;
        
        [self setup];
    }
    return self;
}

// 进行初始化设置（一般设置控件）
- (void)setup{
    
}


/**
 修改占位符字体

 @param placeholderFont 要更改的字体
 */
- (void)setPlaceholderFont:(UIFont *)placeholderFont{
    
    if (_placeholderFont != placeholderFont) {
        _placeholderFont = placeholderFont;
        
        [self setValue:self.placeholderFont forKeyPath:@"_placeholderLabel.font"];
    }
}


/**
 修改占位符的颜色

 @param placeholderColor 要更改的颜色
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    if (_placeholderColor != placeholderColor) {
        _placeholderColor  = placeholderColor;
        
        [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
}


/**
 占位符／文本／编辑文本距离边框的位置

 @param bounds <#bounds description#>
 @return <#return value description#>
 */
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    
    if (self.marginLeft) {
        iconRect.origin.x += self.marginLeft; //像右边偏
    }

    return iconRect;
}

// 控制placeHolder的位置
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect boundsTemp = [super placeholderRectForBounds:bounds];
    
    if (self.marginLeft) {
        
        boundsTemp = CGRectMake(bounds.origin.x+self.marginLeft, bounds.origin.y, bounds.size.width - self.marginLeft, bounds.size.height);
    }
    
    return boundsTemp;
}

// 控制显示文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds{
    
    CGRect boundsTemp = [super textRectForBounds:bounds];
    
    if (self.marginLeft) {
        
        boundsTemp = CGRectMake(bounds.origin.x+self.marginLeft, bounds.origin.y, bounds.size.width -self.marginLeft, bounds.size.height);
    }

    return boundsTemp;
}

// 控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    CGRect boundsTemp = [super editingRectForBounds:bounds];

    if (self.marginLeft) {
        
        boundsTemp = CGRectMake(bounds.origin.x +self.marginLeft, bounds.origin.y, bounds.size.width - self.marginLeft, bounds.size.height);
    }

    return boundsTemp;
}


@end
