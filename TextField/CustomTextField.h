//
//  CustomTextField.h
//
//  Created by Apple on 17/5/4.
//  Copyright © 2017年 silence. All rights reserved.
//  自定义 UITextField，
//  主要用于1.修改placeholder的文本的位置 2.placeholder的字体、颜色


#import <UIKit/UIKit.h>

@interface CustomTextField : UITextField


/**
 距离左边的间距
 */
@property(assign,nonatomic)CGFloat marginLeft;

/**
 占位符的颜色
 */
@property(strong,nonatomic)UIColor  *placeholderColor;


/**
 占位符的字体(尽量保持和显示文本的字号保持一致，如果不一致会造成占位符文字不能居中显示的情况)
 */
@property(strong,nonatomic)UIFont   *placeholderFont;

/**
 初始化
 
 @param frame      位置大小
 @param marginLeft 距离左边间距
 @return           占位符的颜色
 */
- (instancetype)initWithFrame:(CGRect)frame marginLeft:(CGFloat)marginLeft;

/**
 初始化
 
 @param frame          位置大小
 @param marginLeft     距离左边间距
 @param placeholderStr 占位符
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame marginLeft:(CGFloat)marginLeft placeholderStr:(NSString *)placeholderStr;

/**
 初始化
 
 @param frame              位置大小
 @param marginLeft         距离左边间距
 @param placeholderStr     占位符
 @param placeholderColor   占位符的颜色
 @param placeholderFont    占位符的字体
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame marginLeft:(CGFloat)marginLeft placeholderStr:(NSString *)placeholderStr placeholderColor:(UIColor *)placeholderColor placeholderFont:(UIFont *)placeholderFont;

@end
