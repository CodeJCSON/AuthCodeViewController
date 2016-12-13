//
//  AuthcodeView.m
//  ios生成本地验证码
//
//  Created by 云媒 on 16/10/9.
//  Copyright © 2016年 云媒. All rights reserved.
//

#import "AuthcodeView.h"

#define kRandomColor  [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.0];
#define kCharCount  (arc4random() % 2) + 4
#define kFontSize [UIFont systemFontOfSize:arc4random() % 15 + 15]

@implementation AuthcodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = kRandomColor;
        
        [self getAuthcode];//获得随机验证码
    }
    return self;
}

#pragma mark 获得随机验证码
- (void)getAuthcode
{
    //字符串素材
    _dataArray = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    
    _authCodeStr = [[NSMutableString alloc] initWithCapacity:kCharCount];
    //随机从数组中选取需要个数的字符串，拼接为验证码字符串
    for (int i = 0; i < kCharCount; i++)
    {
        NSInteger index = arc4random() % (_dataArray.count-1);
        NSString *tempStr = [_dataArray objectAtIndex:index];
        _authCodeStr = (NSMutableString *)[_authCodeStr stringByAppendingString:tempStr];
    }
}

#pragma mark 点击界面切换验证码
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self getAuthcode];
    
    //setNeedsDisplay调用drawRect方法来实现view的绘制
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //设置随机背景颜色
    self.backgroundColor = kRandomColor;
    
    //根据要显示的验证码字符串，根据长度，计算每个字符串显示的位置
    NSString *text = [NSString stringWithFormat:@"%@",_authCodeStr];
    
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    int width = rect.size.width/text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    
    CGPoint point;
    
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX,pY;
    for ( int i = 0; i<text.length; i++)
    {
        pX = arc4random() % width + rect.size.width/text.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize}];
    }
    
}
@end
