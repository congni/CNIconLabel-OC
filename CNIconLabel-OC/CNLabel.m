//
//  CNLabel.m
//  PortalHaojuApp
//
//  Created by haoju-congni on 15/7/7.
//  Copyright (c) 2015年 好居. All rights reserved.
//

#import "CNLabel.h"
#import <CNKitCategory/CNKit.h>


@implementation CNLabel


#pragma mark - LifeCycle
#pragma mark 初始化
- (id)init {
    self = [super init];
    
    if (self) {
        self.isIconLeft = YES;
        [self createUI];
    }
    
    return self;
}

#pragma mark - Private
#pragma mark 创建UI
- (void)createUI {
    self.iconImgView = [UIImageView new];
    self.titleLabel = [UILabel new];
    
    [self addSubview:self.iconImgView];
    [self addSubview:self.titleLabel];
}

#pragma mark 被点击的时候
- (void)thisClk {
//    [self sendObject:@"clk"];
}

#pragma mark 是否可被点击
- (void)canClkIt:(BOOL)isClkBool {
    if (isClkBool) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(thisClk)];
        [self addGestureRecognizer:tapGesture];
    } else {
        if (self.gestureRecognizers.count > 0) {
            while (self.gestureRecognizers.count > 0) {
                UIGestureRecognizer *gesture = [self.gestureRecognizers objectAtIndex:0];
                [self removeGestureRecognizer:gesture];
            }
        }
    }
}

#pragma mark - Public
#pragma mark 设置尺寸
-(void)resize {
    CGFloat imageWidthFloat = self.iconImgView.image.size.width;
    CGFloat imageHeightFloat = self.iconImgView.image.size.height;
    
    self.iconImgView.width = imageWidthFloat;
    self.iconImgView.height = imageHeightFloat;
    
    if (self.titleLabel.text) {
        [self.titleLabel sizeToFit];
    } else if (self.titleLabel.attributedText){
        [self.titleLabel resizeToFitTextContentsForAttributeText:YES];
    }
    
    self.iconImgView.x = self.iconImgView.y = 0.0;
    
    float titleLabelXFloat = self.iconImgView.x + self.iconImgView.width + self.space;
    float titleLabelYFloat = 0.0;
    float iconImgYFloat = 0.0;
    float iconImgXFloat = 0.0;
    
    if (self.titleLabel.height < self.iconImgView.height) {
        titleLabelYFloat = (self.iconImgView.height - self.titleLabel.height) / 2.0;
    } else {
        iconImgYFloat = (self.titleLabel.height - self.iconImgView.height) / 2.0;
    }
    
    if (!self.isIconLeft) {
        titleLabelXFloat = 0.0;
        iconImgXFloat = titleLabelXFloat + self.titleLabel.width + self.space;
    }
    
    self.titleLabel.x = titleLabelXFloat;
    self.titleLabel.y = titleLabelYFloat;
    
    self.iconImgView.y = iconImgYFloat;
    self.iconImgView.x = iconImgXFloat;
    
    if (self.isIconLeft) {
        self.width = self.titleLabel.x + self.titleLabel.width;
    } else {
        self.width = self.iconImgView.x + self.iconImgView.width;
    }
    
    self.height = MAX(self.iconImgView.height, self.titleLabel.height);
}

#pragma mark 调整上下尺寸
- (void)resizeForUpdown {
    CGFloat imageWidthFloat = self.iconImgView.image.size.width;
    CGFloat imageHeightFloat = self.iconImgView.image.size.height;
    
    self.iconImgView.width = imageWidthFloat;
    self.iconImgView.height = imageHeightFloat;
    
    if (self.titleLabel.text) {
        [self.titleLabel sizeToFit];
    } else if (self.titleLabel.attributedText){
        [self.titleLabel resizeToFitTextContentsForAttributeText:YES];
    }
    
    float titleLabelXFloat = 0;
    float titleLabelYFloat = 0.0;
    float iconImgYFloat = 0.0;
    float iconImgXFloat = 0.0;
    
    if (self.titleLabel.width < self.iconImgView.width) {
        iconImgXFloat = 0.0;
        titleLabelXFloat = (self.iconImgView.width - self.titleLabel.width) / 2.0;
    } else {
        titleLabelXFloat = 0.0;
        iconImgXFloat = (self.titleLabel.width - self.iconImgView.width) / 2.0;
    }
    
    if (self.isIconUp) {
        iconImgYFloat = 0.0;
        titleLabelYFloat = self.iconImgView.height + self.space;
    } else {
        titleLabelYFloat = 0.0;
        iconImgYFloat = self.titleLabel.height + self.space;
    }
    
    self.titleLabel.x = titleLabelXFloat;
    self.titleLabel.y = titleLabelYFloat;
    
    self.iconImgView.y = iconImgYFloat;
    self.iconImgView.x = iconImgXFloat;
    
    if (self.isIconUp) {
        self.height = self.titleLabel.y + self.titleLabel.height;
    } else {
        self.height = self.iconImgView.y + self.iconImgView.height;
    }
    
    self.width = MAX(self.iconImgView.width, self.titleLabel.width);
}

#pragma mark 更新宽度
- (void)updateWidth:(float)widthFloat {
    if (self.width > widthFloat) {
        if (self.isIconLeft) {
            self.titleLabel.width = widthFloat - self.titleLabel.x;
        } else {
            self.iconImgView.x = widthFloat - self.iconImgView.width - self.space;
            self.titleLabel.width = self.iconImgView.x - self.space;
        }
    }
    
    self.width = widthFloat;
}

@end
