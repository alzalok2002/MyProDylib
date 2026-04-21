#import <UIKit/UIKit.h>

@interface MyProMenu : UIView
@end

@implementation MyProMenu
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        self.layer.cornerRadius = 12;
        self.clipsToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor cyanColor].CGColor;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, frame.size.width, 30)];
        label.text = @"MOHAMMED MENU";
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}
@end

static MyProMenu *mainMenu;

// دالة التشغيل الآمنة
static void initMenu() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = nil;
        if (@available(iOS 13.0, *)) {
            for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
                if (scene.activationState == UISceneActivationStateForegroundActive) {
                    window = scene.windows.firstObject;
                    break;
                }
            }
        } else {
            window = [UIApplication sharedApplication].keyWindow;
        }

        if (window && !mainMenu) {
            mainMenu = [[MyProMenu alloc] initWithFrame:CGRectMake(40, 80, 220, 150)];
            [window addSubview:mainMenu];
            NSLog(@"[MOHAMMED] Menu added successfully!");
        }
    });
}

__attribute__((constructor)) static void load() {
    initMenu();
}
