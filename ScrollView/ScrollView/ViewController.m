//
//  ViewController.m
//  ScrollView
//
//  Created by wanpeng on 2021/4/6.
//

#import "ViewController.h"
#import "YLBaseScrollView.h"
#import "YLBaseTableView.h"
#import <Masonry/Masonry.h>
#import "TLTestViewController.h"


#define kScreen_Widht [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
<UIScrollViewDelegate>

@property (nonatomic, strong) YLBaseScrollView *scrollView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initializeUI];
    [self addChildViewControllers];
    // Do any additional setup after loading the view.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"跟控制器 %s",__func__);
}

#pragma mark - UI

- (void)initializeUI {
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:topView];
    self.topView = topView;
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.height.equalTo(@200);
    }];
    
    
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:titleView];
    self.titleView = titleView;
    
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@200);
        make.left.right.mas_equalTo(self.view);
        make.height.equalTo(@50);
    }];
    
}

- (void)addChildViewControllers {
    
    for (int i = 0; i < 4; i++) {
        TLTestViewController *vc = [[TLTestViewController alloc] init];
        [self addChildViewController:vc];
    }
    self.scrollView.contentSize = CGSizeMake(kScreen_Widht * 5, kScreen_Height);
    
    UIView *childView = self.childViewControllers.firstObject.view;
    [self.scrollView addSubview:childView];
    
    [childView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.titleView.mas_bottom);
    }];
}



- (YLBaseScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[YLBaseScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor redColor];
    }
    return _scrollView;
}


@end
