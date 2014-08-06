//
//  Dock.m
//  weibo
//
//  Created by dingql on 14-8-6.
//  Copyright (c) 2014年 dingql. All rights reserved.
//

#import "Dock.h"

@interface Dock ()
{
    int _currentSelectedIndex;
    UIView * _selectedSlider;
    NSArray * _contentArray;
}

@end

@implementation Dock


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
        //_selectedSlider = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbar_slider.png"]];
        
        _selectedSlider = [[UIView alloc]init];
        _selectedSlider.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_selectedSlider ];
    }
    return self;
}

- (void)addItemsWithArray:(NSArray *)array
{
    _contentArray = [NSArray arrayWithArray:array];
    [self adjustItemPosition];
}

- (void)itemBtnClicked:(DockItem *)btn
{
    // 点击了与当前不同的按钮时切换
    int index = btn.tag;
    if (index != _currentSelectedIndex) {
        [self selectDockItemAtIndex:index];
        CGRect rect = btn.bounds;
        
        [UIView animateWithDuration:0.5 animations:^{
            _selectedSlider.frame = (CGRect){{index * rect.size.width, 0}, rect.size};
        }];
    }
    
    if (_clickedBlock) {
        _clickedBlock(index);
    }
}

- (void)selectDockItemAtIndex:(int)index
{
    // 取消原来按钮的选中状态, subviews[0]为 _selectedSlider
    DockItem * item = self.subviews[_currentSelectedIndex + 1];
    item.selected = NO;
    
    // 设置新的按钮的选中状态, subviews[0]为 _selectedSlider
    DockItem * newItem = self.subviews[index + 1];
    newItem.selected = YES;
    _currentSelectedIndex = index;
}

- (void)adjustItemPosition
{
    int count = _contentArray.count;
    int itemWidth = self.bounds.size.width / count;
    for (int i = 0; i < count; i ++)
    {
        DockItem * btn = _contentArray[i];
        btn.tag = i;
        btn.frame = CGRectMake(i * itemWidth, 0, itemWidth, kDockHeight);
        [btn addTarget:self action:@selector(itemBtnClicked:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        // 设置默认选中的按钮
        if (i == 0) {
            btn.selected = YES;
            _currentSelectedIndex = 0;
        }
    }
    
    _selectedSlider.frame = (CGRect){CGPointZero, {itemWidth, kDockHeight}};
}

#pragma mark - deprecated method
- (void)addItemWithText:(NSString *)text Icon:(NSString *)iconName DEPRECATED_ATTRIBUTE
{
    DockItem * item = [DockItem buttonWithType:UIButtonTypeCustom];
    [self addSubview:item];
    
    // 设置头像
    [item setImage: [UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [item setImage: [UIImage imageNamed:[iconName appendStringWithString:@"_selected"]] forState:UIControlStateSelected];
    // 设置标题
    [item setTitle:text forState:UIControlStateNormal];
    [item setTitle:text forState:UIControlStateSelected];
    [item addTarget:self action:@selector(itemBtnClicked:) forControlEvents:UIControlEventTouchDown];
    
    // 调整布局
    [self adjustItemPosition];
    
}

@end
