//
//  AuthcodeView.h
//  ios生成本地验证码
//
//  Created by 云媒 on 16/10/9.
//  Copyright © 2016年 云媒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthcodeView : UIView
@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串
@end
