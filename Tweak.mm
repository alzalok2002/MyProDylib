#import <UIKit/UIKit.h>

// تعريف واجهة المنيو
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

        self.sw1 = [[UISwitch alloc] initWithFrame:CGRectMake(20, 60, 0, 0)];
        [self addSubview:self.sw1];
        
        UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, 150, 30)];
        l1.text = @"ثبات السلاح";
        l1.textColor = [UIColor whiteColor];
        [self addSubview:l1];

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

// كود التحكم
static MyMenuV *myGlobalMenu;

@interface MenuHandler : NSObject
+ (void)toggleMenu;
@end

@implementation MenuHandler
+ (void)toggleMenu {
    if (myGlobalMenu) {
        myGlobalMenu.hidden = !myGlobalMenu.hidden;
    }
}
@end

// التشغيل التلقائي
__attribute__((constructor)) static void initialize() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *activeWindow = nil;
        // الطريقة الحديثة للحصول على النافذة في iOS 13+
        for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if ([scene isKindOfClass:[UIWindowScene class]] && scene.activationState == UISceneActivationStateForegroundActive) {
                activeWindow = ((UIWindowScene *)scene).windows.firstObject;
                break;
            }
        }

        if (activeWindow) {
            myGlobalMenu = [[MyMenuV alloc] initWithFrame:CGRectMake(50, 100, 250, 200)];
            myGlobalMenu.hidden = YES;
            [activeWindow addSubview:myGlobalMenu];

            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:[MenuHandler class] action:@selector(toggleMenu)];
            tap.numberOfTouchesRequired = 3; 
            [activeWindow addGestureRecognizer:tap];
            
            NSLog(@"🚀 MOHAMMED MENU LOADED!");
        }
    });
}
