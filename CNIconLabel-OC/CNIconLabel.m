//
//  CNIconLabel.m
//  MakeupLessons
//
//  Created by 葱泥 on 16/6/3.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import "CNIconLabel.h"

@implementation CNIconLabel
@synthesize textPositionAdjustmentOffset = _textPositionAdjustmentOffset;
@synthesize textLabelFont = _textLabelFont;
@synthesize textLabelColor = _textLabelColor;
@synthesize iconStyle = _iconStyle;
@synthesize labelAlpha = _labelAlpha;


#pragma mark -LifeCycle
#pragma mark 初始化
- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initData];
    }
    
    return self;
}

#pragma mark -Public Method
#pragma mark 更新文字， 图片沿用之前设置
- (void)updateText:(NSString *)text {
    [self labelWithText:text image:_iconImageView.image];
}

#pragma mark 更新图片， 文字沿用之前设置
- (void)updateImage:(UIImage *)iconImg {
    [self labelWithText:_textLabel.text image:iconImg];
}

#pragma mark 显示图标文字
- (void)labelWithText:(NSString *)text image:(UIImage *)img {
    if (text != nil && ![text isEqualToString:@""]) {
        if (!_textLabel) {
            _textLabel = [[UILabel alloc] init];
            _textLabel.text = text;
            _textLabel.textColor = self.textLabelColor;
            _textLabel.font = self.textLabelFont;
            [self addSubview:_textLabel];
        } else {
            _textLabel.text = text;
        }
    } else {
        [_textLabel removeFromSuperview];
        _textLabel = nil;
    }
    
    if (img) {
        if (!_iconImageView) {
            _iconImageView = [[UIImageView alloc] init];
            _iconImageView.image = img;
            [self addSubview:_iconImageView];
        } else {
            _iconImageView.image = img;
        }
    } else {
        [_iconImageView removeFromSuperview];
        _iconImageView = nil;
    }
    
    [self judgeWithOutStyle];
    [self positionAdjust];
}

#pragma mark -Private Method
#pragma mark 初始化输数据
- (void)initData {
    _withOutStyle = All;
    self.textPositionAdjustmentOffset = UIOffsetMake(5.0, 5.0);
    self.textLabelFont = [UIFont systemFontOfSize:12.0];
    self.textLabelColor = [UIColor whiteColor];
    self.iconStyle = IconPositionStyle_Left;
    self.labelAlpha = 1.0;
    self.maxWidth = CGFLOAT_MAX;
}

#pragma mark 判断类型
- (void)judgeWithOutStyle {
    if (!_textLabel) {
        _withOutStyle = OutText;
    } else if (!_iconImageView) {
        _withOutStyle = OutImage;
    } else {
        _withOutStyle = All;
    }
}

#pragma mark 自适应大小位置
- (void)positionAdjust {
    float imageWidth = 0.0;
    float imageHeight = 0.0;
    float imageViewPositionX = 0.0;
    float imageViewPositionY = 0.0;
    float textLabelWidth = 0.0;
    float textLabelHeight = 0.0;
    float textLabelPositionX = 0.0;
    float textLabelPositionY = 0.0;
    float viewWidth = 0.0;
    float viewHeigth = 0.0;
    
    if (_withOutStyle == All) {
        imageWidth = _iconImageView.image.size.width;
        imageHeight = _iconImageView.image.size.height;
        
        [_textLabel sizeToFit];
        textLabelWidth = _textLabel.frame.size.width;
        textLabelHeight = _textLabel.frame.size.height;
        
        if (self.iconStyle == IconPositionStyle_Left) {
            textLabelPositionX = imageViewPositionX + imageWidth + self.textPositionAdjustmentOffset.vertical;
            
            if (textLabelHeight < imageHeight) {
                textLabelPositionY = (imageHeight - textLabelHeight) / 2.0;
            } else {
                textLabelPositionY = 0.0;
                imageViewPositionY = (textLabelHeight - imageHeight) / 2.0;
            }
            
            viewWidth = textLabelPositionX + textLabelWidth;
            viewHeigth = MAX(textLabelHeight, imageHeight);
            
            if (viewWidth > self.maxWidth) {
                textLabelWidth = self.maxWidth - textLabelPositionX;
                viewWidth = self.maxWidth;
            }
        } else if (self.iconStyle == IconPositionStyle_Up) {
            if (textLabelWidth < imageWidth) {
                textLabelPositionX = (imageWidth - textLabelWidth) / 2.0;
            } else {
                textLabelPositionX = 0.0;
                imageViewPositionX = (textLabelWidth - imageWidth) / 2.0;
            }
            
            textLabelPositionY = imageHeight + imageViewPositionY + self.textPositionAdjustmentOffset.horizontal;
            
            viewWidth = MAX(textLabelWidth, imageWidth);
            viewHeigth = textLabelPositionY + textLabelHeight;
            
            if (textLabelWidth > self.maxWidth) {
                textLabelWidth = self.maxWidth;
                viewWidth = self.maxWidth;
            }
        } else if (self.iconStyle == IconPositionStyle_Right) {
            textLabelPositionX = 0.0;
            imageViewPositionX = textLabelPositionX + textLabelWidth + self.textPositionAdjustmentOffset.vertical;
            
            if (textLabelHeight < imageHeight) {
                textLabelPositionY = (imageHeight - textLabelHeight) / 2.0;
            } else {
                textLabelPositionY = 0.0;
                imageViewPositionY = (textLabelHeight - imageHeight) / 2.0;
            }
            
            viewWidth = imageViewPositionX + imageWidth;
            viewHeigth = MAX(textLabelHeight, imageHeight);
            
            if (viewWidth > self.maxWidth) {
                imageViewPositionX = self.maxWidth - imageWidth;
                textLabelWidth = imageViewPositionX - self.textPositionAdjustmentOffset.vertical;
                viewWidth = self.maxWidth;
            }
        } else if (self.iconStyle == IconPositionStyle_Bottom) {
            if (textLabelWidth < imageWidth) {
                textLabelPositionX = (imageWidth - textLabelWidth) / 2.0;
            } else {
                textLabelPositionX = 0.0;
                imageViewPositionX = (textLabelWidth - imageWidth) / 2.0;
            }
            
            textLabelPositionY = 0.0;
            imageViewPositionY = textLabelPositionY + textLabelHeight + self.textPositionAdjustmentOffset.horizontal;
            
            viewWidth = MAX(imageWidth, textLabelWidth);
            viewHeigth = imageViewPositionY + imageHeight;
            
            if (textLabelWidth > self.maxWidth) {
                textLabelWidth = self.maxWidth;
                viewWidth = self.maxWidth;
            }
        }
        
        _textLabel.frame = CGRectMake(textLabelPositionX, textLabelPositionY, textLabelWidth, textLabelHeight);
        _iconImageView.frame = CGRectMake(imageViewPositionX, imageViewPositionY, imageWidth, imageHeight);
    } else if (_withOutStyle == OutImage) {
        [_textLabel sizeToFit];
        textLabelWidth = _textLabel.frame.size.width;
        textLabelHeight = _textLabel.frame.size.height;
        viewWidth = textLabelWidth;
        viewHeigth = textLabelHeight;
        _textLabel.frame = CGRectMake(textLabelPositionX, textLabelPositionY, textLabelWidth, textLabelHeight);
    } else if (_withOutStyle == OutText) {
        imageWidth = _iconImageView.image.size.width;
        imageHeight = _iconImageView.image.size.height;
        viewWidth = imageWidth;
        viewHeigth = imageHeight;
        _iconImageView.frame = CGRectMake(imageViewPositionX, imageViewPositionY, imageWidth, imageHeight);
    }
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, viewWidth, viewHeigth);
}

#pragma mark -GET/SET
#pragma mark textPositionAdjustmentOffset GET
- (UIOffset)textPositionAdjustmentOffset {
    return _textPositionAdjustmentOffset;
}

#pragma mark textPositionAdjustmentOffset SET
- (void)setTextPositionAdjustmentOffset:(UIOffset)textPositionAdjustmentOffset {
    _textPositionAdjustmentOffset = textPositionAdjustmentOffset;
    
    if (_textLabel && _iconImageView) {
        [self judgeWithOutStyle];
        [self positionAdjust];
    }
}

#pragma mark textLabelFont GET
- (UIFont *)textLabelFont {
    return _textLabelFont;
}

#pragma mark textLabelFont SET
- (void)setTextLabelFont:(UIFont *)textLabelFont {
    _textLabelFont = textLabelFont;
    
    if (_textLabel) {
        _textLabel.font = textLabelFont;
        [self judgeWithOutStyle];
        [self positionAdjust];
    }
}

#pragma mark textLabelColor GET
- (UIColor *)textLabelColor {
    return _textLabelColor;
}

#pragma mark textLabelColor SET
- (void)setTextLabelColor:(UIColor *)textLabelColor {
    _textLabelColor = textLabelColor;
    
    if (_textLabel) {
        _textLabel.textColor = textLabelColor;
        [self judgeWithOutStyle];
        [self positionAdjust];
    }
}

#pragma mark iconStyle GET
- (IconPositionStyle)iconStyle {
    return _iconStyle;
}

#pragma mark iconStyle SET
- (void)setIconStyle:(IconPositionStyle)iconStyle {
    _iconStyle = iconStyle;
    
    if (_textLabel && _iconImageView) {
        [self judgeWithOutStyle];
        [self positionAdjust];
    }
}

#pragma mark labelAlpha GET
- (float)labelAlpha {
    return _labelAlpha;
}

#pragma mark labelAlpha SET
- (void)setLabelAlpha:(float)labelAlpha {
    _labelAlpha = labelAlpha;
    
    if (_textLabel) {
        _textLabel.alpha = labelAlpha;
    }
}

@end
