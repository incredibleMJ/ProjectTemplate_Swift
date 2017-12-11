//
//  CNPPopupController.h
//  CNPPopupController
//
//  Created by Carson Perrotti on 2014-09-28.
//  Copyright (c) 2014 Carson Perrotti. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CNPPopupControllerDelegate;
@class CNPPopupTheme, CNPPopupButton;

@interface CNPPopupController : NSObject

@property (nonatomic, strong) CNPPopupTheme *_Nonnull theme;
@property (nonatomic, weak) id <CNPPopupControllerDelegate> _Nullable delegate;

- (nonnull instancetype) init __attribute__((unavailable("You cannot initialize through init - please use initWithContents:")));
- (nonnull instancetype)initWithContents:(nonnull NSArray<UIView *> *)contents NS_DESIGNATED_INITIALIZER;

- (void)presentPopupControllerAnimated:(BOOL)flag;
- (void)dismissPopupControllerAnimated:(BOOL)flag;

@end

@protocol CNPPopupControllerDelegate <NSObject>

@optional
- (void)popupControllerWillPresent:(nonnull CNPPopupController *)controller;
- (void)popupControllerDidPresent:(nonnull CNPPopupController *)controller;
- (void)popupControllerWillDismiss:(nonnull CNPPopupController *)controller;
- (void)popupControllerDidDismiss:(nonnull CNPPopupController *)controller;

@end

typedef void(^SelectionHandler) (CNPPopupButton *_Nonnull button);

@interface CNPPopupButton : UIButton

@property (nonatomic, copy) SelectionHandler _Nullable selectionHandler;

@end

// CNPPopupStyle: Controls how the popup looks once presented
typedef NS_ENUM(NSUInteger, CNPPopupStyle) {
    CNPPopupStyleActionSheet = 0, // Displays the popup similar to an action sheet from the bottom.
    CNPPopupStyleCentered, // Displays the popup in the center of the screen.
    CNPPopupStyleFullscreen // Displays the popup similar to a fullscreen viewcontroller.
};

// CNPPopupPresentationStyle: Controls how the popup is presented
typedef NS_ENUM(NSInteger, CNPPopupPresentationStyle) {
    CNPPopupPresentationStyleFadeIn = 0,
    CNPPopupPresentationStyleSlideInFromTop,
    CNPPopupPresentationStyleSlideInFromBottom,
    CNPPopupPresentationStyleSlideInFromLeft,
    CNPPopupPresentationStyleSlideInFromRight
};

// CNPPopupMaskType
typedef NS_ENUM(NSInteger, CNPPopupMaskType) {
    CNPPopupMaskTypeClear,
    CNPPopupMaskTypeDimmed,
    CNPPopupMaskTypeCustom
};

NS_ASSUME_NONNULL_BEGIN
@interface CNPPopupTheme : NSObject

@property (nonatomic, strong) UIColor *backgroundColor; // Background color of the popup content view (Default white)
@property (nonatomic, strong) UIColor *customMaskColor; // Custom color for CNPPopupMaskTypeCustom
@property (nonatomic, assign) CGFloat cornerRadius; // Corner radius of the popup content view (Default 4.0)
@property (nonatomic, assign) UIEdgeInsets popupContentInsets; // Inset of labels, images and buttons on the popup content view (Default 16.0 on all sides)
@property (nonatomic, assign) CNPPopupStyle popupStyle; // How the popup looks once presented (Default centered)
@property (nonatomic, assign) CNPPopupPresentationStyle presentationStyle; // How the popup is presented (Defauly slide in from bottom. NOTE: Only applicable to CNPPopupStyleCentered)
@property (nonatomic, assign) CNPPopupMaskType maskType; // Backgound mask of the popup (Default dimmed)
@property (nonatomic, assign) BOOL dismissesOppositeDirection; // If presented from a direction, should it dismiss in the opposite? (Defaults to NO. i.e. Goes back the way it came in)
@property (nonatomic, assign) BOOL shouldDismissOnBackgroundTouch; // Popup should dismiss on tapping on background mask (Default yes)
@property (nonatomic, assign) BOOL movesAboveKeyboard; // Popup should move up when the keyboard appears (Default yes)
@property (nonatomic, assign) CGFloat blurEffectAlpha; // Alpha of the background blur effect (Default 0.0)
@property (nonatomic, assign) CGFloat contentVerticalPadding; // Spacing between each vertical element (Default 12.0)
@property (nonatomic, assign) CGFloat maxPopupWidth; // Maxiumum width that the popup should be (Default 300)
@property (nonatomic, assign) CGFloat animationDuration; // Duration of presentation animations (Default 0.3s)

// Factory method to help build a default theme
+ (CNPPopupTheme *)defaultTheme;

@end
NS_ASSUME_NONNULL_END
