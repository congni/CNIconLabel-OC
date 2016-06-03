OC版本的图标按钮，支持上下左右四个方位的图标位置；
支持文本的一切修改；
支持图片、文本的更新及单独更新；
支持纯文本、纯图片，但不建议使用；
支持大小自适应；
支持pod集成：
pod 'CNIconLabel-OC', '~> 1.0.1'

使用：
CNIconLabel *label = [[CNIconLabel alloc] init];
label.iconStyle = IconPositionStyle_Up;//支持四个方位
label.textLabelColor = [UIColor colorWithHexString:@"ffffff"];
label.textLabelFont = [UIFont systemFontOfSize:15.0];
label.textPositionAdjustmentOffset = UIOffsetMake(16.0, 0.0);
[label labelWithText:@"文本" image:[UIImage imageNamed:@"图片"]];

swift版本后续会发出来