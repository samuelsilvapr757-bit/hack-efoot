#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static UIWindow *janelaHack;

@interface PainelHack : UIWindow
@end

@implementation PainelHack

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(10, 60, 260, 400)];
    self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.95];
    self.layer.cornerRadius = 15;
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.clipsToBounds = YES;
    self.windowLevel = UIWindowLevelAlert + 999;
    
    UILabel *t = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 240, 30)];
    t.text = @"⚽ HACK ATIVO";
    t.textColor = [UIColor greenColor];
    t.font = [UIFont boldSystemFontOfSize:18];
    t.textAlignment = NSTextAlignmentCenter;
    [self addSubview:t];
    
    UIButton *b1 = [self criarBotao:@"SPEED HACK" y:55 cor:[UIColor blueColor]];
    [b1 addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:b1];
    
    UIButton *b2 = [self criarBotao:@"FORÇA DIVINA" y:100 cor:[UIColor orangeColor]];
    [b2 addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:b2];
    
    UIButton *b3 = [self criarBotao:@"GOL PERFEITO" y:145 cor:[UIColor redColor]];
    [b3 addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:b3];
    
    UIButton *b4 = [self criarBotao:@"DRIBLE TOTAL" y:190 cor:[UIColor purpleColor]];
    [b4 addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:b4];
    
    UIButton *b5 = [self criarBotao:@"GOLEIRO ABSOLUTO" y:235 cor:[UIColor greenColor]];
    [b5 addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:b5];
    
    UIButton *b6 = [self criarBotao:@"IMORTAL" y:280 cor:[UIColor darkGrayColor]];
    [b6 addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:b6];
    
    UIButton *fechar = [UIButton buttonWithType:UIButtonTypeSystem];
    fechar.frame = CGRectMake(10, 330, 240, 35);
    fechar.backgroundColor = [UIColor redColor];
    [fechar setTitle:@"✕" forState:UIControlStateNormal];
    [fechar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fechar.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    fechar.layer.cornerRadius = 10;
    [fechar addTarget:self action:@selector(fechar) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:fechar];
    
    UIPanGestureRecognizer *p = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(arrastar:)];
    [self addGestureRecognizer:p];
    
    return self;
}

- (UIButton *)criarBotao:(NSString *)titulo y:(int)y cor:(UIColor *)cor {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    b.frame = CGRectMake(10, y, 240, 38);
    b.backgroundColor = cor;
    [b setTitle:titulo forState:UIControlStateNormal];
    [b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    b.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    b.layer.cornerRadius = 10;
    return b;
}

- (void)ok:(UIButton *)s {
    NSString *msg = s.titleLabel.text;
    UIAlertController *a = [UIAlertController alertControllerWithTitle:@"✅ ATIVADO" message:[NSString stringWithFormat:@"%@ ativado com sucesso!", msg] preferredStyle:UIAlertControllerStyleAlert];
    [a addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:a animated:YES completion:nil];
}

- (void)fechar { self.hidden = YES; }

- (void)arrastar:(UIPanGestureRecognizer *)g {
    CGPoint t = [g translationInView:self];
    self.center = CGPointMake(self.center.x + t.x, self.center.y + t.y);
    [g setTranslation:CGPointZero inView:self];
}

@end

// HOOKS
%hook PlayerController
- (float)sprintSpeed { return 999999.0f; }
- (float)acceleration { return 999999.0f; }
- (float)strength { return 999999.0f; }
- (float)balance { return 999999.0f; }
- (float)agility { return 999999.0f; }
- (float)stamina { return 9999999.0f; }
- (float)bodyChecking { return 999999.0f; }
- (float)jumpHeight { return 999999.0f; }
%end

%hook ShotController
- (float)finishing { return 999999.0f; }
- (float)shotPower { return 999999.0f; }
- (float)shotAccuracy { return 999999.0f; }
- (float)freekicks { return 999999.0f; }
- (float)headers { return 999999.0f; }
%end

%hook DribbleController
- (float)dribbling { return 999999.0f; }
- (float)ballControl { return 999999.0f; }
%end

%hook PassController
- (float)shortPassing { return 999999.0f; }
- (float)longPassing { return 999999.0f; }
- (float)throughBallAccuracy { return 999999.0f; }
- (float)crossing { return 999999.0f; }
- (float)vision { return 999999.0f; }
%end

%hook GoalkeeperController
- (float)diving { return 999999.0f; }
- (float)handling { return 999999.0f; }
- (float)reflexes { return 999999.0f; }
- (float)diveReactionTime { return 0.000001f; }
- (float)diveRange { return 999999.0f; }
- (float)positioning { return 999999.0f; }
%end

%hook StaminaController
- (float)currentStamina { return 9999999.0f; }
- (float)staminaDrainRate { return 0.0f; }
%end

%hook InjuryController
- (BOOL)canGetInjured { return NO; }
%end

%hook AIOpponentController
- (float)aiReactionTime { return 999.0f; }
- (float)aiPassAccuracy { return 0.01f; }
- (float)aiShotAccuracy { return 0.01f; }
- (float)aiSpeed { return 0.1f; }
%end

%hook GameViewController
- (void)viewDidAppear:(BOOL)animated {
    %orig;
    if (!janelaHack) {
        janelaHack = [[PainelHack alloc] init];
        [janelaHack makeKeyAndVisible];
    } else {
        janelaHack.hidden = NO;
    }
}
%end
