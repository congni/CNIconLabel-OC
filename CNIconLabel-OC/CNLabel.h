/**
 *
 * @fileName CNLabel.h on PortalHaojuApp.
 *
 * @abstract CNFreePicker.
 *
 * @author  Created by haoju-congni on 15/7/7.
 *
 * @revise 徐雨塘 on 15/12/11.(最后修改人)
 *
 * @version 1.1 on 15/12/11.()
 *
 Copyright © 2015年 好居网. All rights reserved.
 */

#import <UIKit/UIKit.h>


@interface CNLabel : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, assign) float space;
@property (nonatomic, assign) BOOL isIconLeft;
@property (nonatomic, assign) BOOL isIconUp;
@property (nonatomic, assign, setter = canClkIt:) BOOL canClick;

/**
 * @author 徐雨塘, 15-12-23 09:12:16
 *
 * @brief 设置尺寸
 *
 * @since 3.12.17
 */
- (void)resize;

/**
 * @author 徐雨塘, 15-12-23 09:12:22
 *
 * @brief 调整上下尺寸
 *
 * @since 3.12.17
 */
- (void)resizeForUpdown;

/**
 * @author 徐雨塘, 15-12-23 09:12:26
 *
 * @brief 更新宽度
 *
 * @param width width
 *
 * @since 3.12.17
 */
- (void)updateWidth:(float)width;

@end
