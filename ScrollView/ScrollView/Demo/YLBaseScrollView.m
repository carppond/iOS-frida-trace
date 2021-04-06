//
//  YLBaseScrollView.m
//  ScrollView
//
//  Created by wanpeng on 2021/4/6.
//

#import "YLBaseScrollView.h"

@implementation YLBaseScrollView

//是否支持多时候触发，这里返回YES
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
@end
