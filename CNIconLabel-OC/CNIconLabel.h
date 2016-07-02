//
//  CNIconLabel.h
//  MakeupLessons
//
//  Created by 葱泥 on 16/6/3.
//  Copyright © 2016年 quanXiang. All rights reserved.
//
//
//  注意：本控件为图标按钮，虽支持纯文本、纯图片，但是不推荐纯文本、纯图片情况下使用本空间；
//  swift版本也有响应提供
//
//

#import <UIKit/UIKit.h>


/**
 *  图标位置
 */
typedef NS_ENUM(NSInteger, IconPositionStyle) {
    /**
     *  左侧
     */
    IconPositionStyle_Left   = 1,
    /**
     *  上边
     */
    IconPositionStyle_Up     = 2,
    /**
     *  右侧
     */
    IconPositionStyle_Right  = 3,
    /**
     *  底部
     */
    IconPositionStyle_Bottom = 4,
};

/**
 *  类型
 */
typedef NS_ENUM(NSInteger, WithOutStyle) {
    /**
     *  有文字和图片
     */
    All      = 1,
    /**
     *  没有图片只有文字
     */
    OutImage = 2,
    /**
     *  没有文字只有图片
     */
    OutText  = 3,
};

@interface CNIconLabel : UIControl {
    // 文本
    UILabel *_textLabel;
    // 图标
    UIImageView *_iconImageView;
    // 类型
    WithOutStyle _withOutStyle;
}

/**
 *  文字与图标之间的间距
 */
@property (nonatomic, assign) UIOffset textPositionAdjustmentOffset;
/**
 *  字体
 */
@property (nonatomic, strong) UIFont *textLabelFont;
/**
 *  颜色
 */
@property (nonatomic, strong) UIColor *textLabelColor;
/**
 *  图标类型  默认左侧
 */
@property (nonatomic, assign) IconPositionStyle iconStyle;
/**
 *  设置label文字的透明度，其目的用于便于设置按钮的触控面积，特别是返回按钮
 */
@property (nonatomic, assign) float labelAlpha;
/**
 *  最大宽度设定，默认无限制
 */
@property (nonatomic, assign) CGFloat maxWidth;

/**
 *  更新文字， 图片沿用之前设置
 *
 *  @param text 文字
 */
- (void)updateText:(NSString *)text;

/**
 *  更新图片， 文字沿用之前设置
 *
 *  @param iconImg 图片
 */
- (void)updateImage:(UIImage *)iconImg;

/**
 *  显示图标文字
 *
 *  @param text 文字
 *  @param img  图片
 */
- (void)labelWithText:(NSString *)text image:(UIImage *)img;

@end
