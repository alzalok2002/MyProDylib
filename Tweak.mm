#import <UIKit/UIKit.h>

@interface MyProMenu : UIView
@end

@implementation MyProMenu
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
        self.layer.cornerRadius = 15;
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor greenColor].CGColor;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 30)];
        label.text = @"MOHAMMED PRO";
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}
@end

static void initMenu() {
    // انتظار 15 ثانية عشان اللعبة تحمل ملفاتها وما تكرش
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = nil;
        
        // الطريقة الوحيدة الآمنة لـ iOS 16/17/18
        for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                window = scene.windows.firstObject;
                break;
            }
        }

        if (window) {
            MyProMenu *menu = [[MyProMenu alloc] initWithFrame:CGRectMake(50, 100, 240, 160)];
            [window addSubview:menu];
        }
    });
}

__attribute__((constructor)) static void load() {
    initMenu();
}
