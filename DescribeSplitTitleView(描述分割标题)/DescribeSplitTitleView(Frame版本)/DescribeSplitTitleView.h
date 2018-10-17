//  DescribeSplitTitleView.h
//  自定义组件view
//
//  Created by silence on 2018/10/17.
//  Copyright © 2018年 silence. All rights reserved.

//  试图描述
//  自定义描述分割标题view（不支持换行）
//  样式如下：
//  ——————————   这是分割线标题   ——————————

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface DescribeSplitTitleView : UIView


/**
 分割线颜色，默认颜色灰色RGBA(185, 193, 199, 1)
 */
@property(strong,nonatomic)UIColor  *lineColor;

/**
 分割线的高度，默认为1
 */
@property(assign,nonatomic)CGFloat lineHeight;

/**
 分割线距离屏幕的间距，默认30
 */
@property(assign,nonatomic)CGFloat edgeMargin;


/**
 分割线距离标题的间距，默认20
 */
@property(assign,nonatomic)CGFloat titleMargin;

/**
 标题的内容
 */
@property(copy,nonatomic)NSString *titleContent;

/**
 标题的颜色
 */
@property(strong,nonatomic)UIColor  *textColor;

/**
 设置标题的字体
 */
@property(strong,nonatomic)UIFont  *titleFont;


@end
