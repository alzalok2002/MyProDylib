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
        self.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 30)];
        label.text = @"MOHAMMED PRO MENU";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}
@end

static MyProMenu *mainMenu;

static void initMenu() {
    // انتظار 15 ثانية عشان اللعبة تستقر وما تكرش
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = nil;
        
        // الطريقة الحديثة والوحيدة المقبولة في iOS 15-18
        if (@available(iOS 13.0, *)) {
            for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
                if (scene.activationState == UISceneActivationStateForegroundActive) {
                    window = scene.windows.firstObject;
                    break;
                }
            }
        }

        if (window && !mainMenu) {
            mainMenu = [[MyProMenu alloc] initWithFrame:CGRectMake(50, 100, 240, 160)];
            [window addSubview:mainMenu];
            NSLog(@"[MOHAMMED] Done! Menu is up.");
        }
    });
}

__attribute__((constructor)) static void load() {
    initMenu();
}
