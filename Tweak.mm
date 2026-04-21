#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

// واجهة المنيو البسيطة
@interface MyMenuV : UIView
@property (nonatomic, strong) UISwitch *sw1;
@property (nonatomic, strong) UISwitch *sw2;
@end

@implementation MyMenuV
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        self.layer.cornerRadius = 15;
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor greenColor].CGColor;

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 30)];
        title.text = @"PRO MENU - MOHAMMED";
        title.textColor = [UIColor whiteColor];
        title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:title];

        // زر تفعيل الثبات (Switch 1)
        self.sw1 = [[UISwitch alloc] initWithFrame:CGRectMake(20, 60, 0, 0)];
        [self addSubview:self.sw1];
        
        UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, 150, 30)];
        l1.text = @"ثبات السلاح";
        l1.textColor = [UIColor whiteColor];
        [self addSubview:l1];

        // زر تفعيل الانتينة (Switch 2)
        self.sw2 = [[UISwitch alloc] initWithFrame:CGRectMake(20, 110, 0, 0)];
        [self addSubview:self.sw2];

        UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectMake(80, 110, 150, 30)];
        l2.text = @"أنتينة";
        l2.textColor = [UIColor whiteColor];
        [self addSubview:l2];
    }
    return self;
}
@end

// كود اكتشاف الضغط بـ 3 أصابع
__attribute__((constructor)) static void initialize() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        MyMenuV *menu = [[MyMenuV alloc] initWithFrame:CGRectMake(50, 100, 250, 200)];
        menu.hidden = YES;
        [keyWindow addSubview:menu];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:nil action:nil];
        tap.numberOfTouchesRequired = 3;
        [tap addTarget:[getBlock block:^(id sender) { menu.hidden = !menu.hidden; }] action:@selector(invoke)];
        [keyWindow addGestureRecognizer:tap];
        NSLog(@"🚀 MOHAMMED MENU LOADED!");
    });
}
